import 'package:earning_app/Services/shared_pref_service.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController bankName= TextEditingController();
    TextEditingController accountNumber= TextEditingController();
    TextEditingController bankaccountHolderName= TextEditingController();
    SharedPrefenceHelper shared=SharedPrefenceHelper();

    return Scaffold(
      appBar:AppBar(title:Text("Contact Info",style: TextStyle(color: Colors.greenAccent,fontSize: 24),)),
      body: SafeArea(child: Container(
        padding: EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bank Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
            TextField(
              controller:bankName ,
              decoration: InputDecoration(
                hintText: "Enter Your Bank Name",
              ),
            ),
            SizedBox(height: 12,),
            Text("Account Number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
            TextField(
              controller:accountNumber ,
              decoration: InputDecoration(
                hintText: "Enter Your Account Number",
              ),
            ),
        SizedBox(height: 12,),
        Text("Account Holder",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
            TextField(
              controller:bankaccountHolderName ,
              decoration: InputDecoration(
                hintText: "Enter Your Name",
            ),
            ),
            SizedBox(height: 12,),
            Center(
              child:ElevatedButton(onPressed: () async{
                      await shared.saveUserName(bankaccountHolderName.text);
                       await shared.saveBankName(bankName.text);
                       print(bankName.text);
                      await shared.saveAcoountNumber(accountNumber.text);

              }, child: Text("Submit Info",style: TextStyle(fontSize: 16,color: Colors.black),))
              ,
            ),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    children: [
                      FutureBuilder(
                          future: shared.getAccountNumber(),
                          builder: (context,snapshot)
                      {
                        if(snapshot.hasData)
                          {
                            return Center(child: Text(snapshot.data ?? 'No Account Number',style: TextStyle(color: Colors.white,fontSize: 24),));
                          }
                        else
                          {
                            return CircularProgressIndicator(); // Loading

                          }
                      })
                    ],
                  )
                ],
              ),

              ),
          ],
        ),
      )),
    );
  }
}
