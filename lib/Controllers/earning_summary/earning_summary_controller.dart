import 'package:get/get.dart';

class EarningSummaryController extends GetxController
{
  //obs mean observable ho ,it's become reacitve if we use .obs and automatically notify garxa listner lai if there is change occur on value
  var paidToday=135.00.obs;
  var weekTotalAmount=635.00.obs;
  var lifetimeEarning=135.00.obs;

  //create a list of preffered contact method and make it's obserable
 List contacts=[
   {'jobId': '#JZ-2401', 'date': 'Apr 17', 'status': 'Paid via Stripe'},
   {'jobId': '#JZ-2401', 'date': 'Apr 17', 'status': 'Paid via Stripe'},
   {'jobId': '#JZ-2401', 'date': 'Apr 17', 'status': 'Paid via Stripe'},
 ].obs; //list ma kehi add vayo remove vayo vanew ui ma ni change auxa jaha yeslai listen gareko xa

}