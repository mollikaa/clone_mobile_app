// ignore_for_file: annotate_overrides

List<Language> langList = [
  Khmer(),
  Language(),
];

class Language {
  String get appName => "Khmer App";
  String get detailScreen => "Detail Screen";
  String get toSystemMode => "To System Mode";
  String get toLightMode => "To Light Mode";
  String get toDarkMode => "To Dark Mode";
  String get theme => "Theme";
  String get language => "Language";
  String get changeToKhmer => "ប្តូរទៅភាសាខ្មែរ";
  String get changeToEnglish => "Change To English";
  String get settings => "Settings";

  //home page : 
  String get hello => "Hello";
  String get whatToWatch => "What do you want to watch?";
  String get hintText => "Search";
  //new movie
  String get upComming => "Upcomming Movies";
  String get newMovie => "New Movies";
  //offersPage
  String get offer => "What we offer";
  String get goldenPass => "Golden Pass";
  String get studentOffer => "Special price for students and senior citizens. Applicable on weekdays, weekends, and public holidays";
  String get buy1free1 => "Buy 1 Get 1 Ticket Free!";
  String get cocaDay => "Celebrate Coca-Cola Day with us!"; 
  String get weekly => "Enjoy weekly discounts by simply registering as a Smart VIP subscriber"; 
  String get location => "All Location"; 
  //fb page
  String get cinema => "Choose Cinema"; 
  //developer screen
  String get aboutUs => "About Us";
  //movie detail 
  String get genre => "Genre";
  String get duration => "Duration";
  String get releaseDate => "Release Date";
  String get classification => "Classification";
  String get showTime => "View Show Time";

  //about us
  String get contactUs => "Contact Us";
  String get privacy => "Privacy Policy";
  String get term => "Term & Conditions";
  //showtime page
  String get timeTicket => "Show Times & Tickets Price:";
  String get branches => "Cinema Branches: ";
  String get screenType =>"Screen Type: ";


}

class Khmer implements Language {
  String get appName => "ខ្មែរអេប";
  String get detailScreen => "ទំព័រលម្អិត";
  String get toSystemMode => "ប្តូរពន្លឺតាមប្រព័ន្ធ";
  String get toLightMode => "ប្តូរទៅភ្លឺ";
  String get toDarkMode => "ប្តូរទៅងងឹត";
  String get theme => "ពន្លឺ";
  String get language => "ភាសា";
  String get changeToKhmer => "ប្តូរទៅភាសាខ្មែរ";
  String get changeToEnglish => "Change To English";
  String get settings => "កំណត់កែប្រែ";

  //home page : 
  String get hello => "សួរស្តី";
  String get whatToWatch => "តើអ្នកចង់មើលអ្វី?";
  String get hintText => "ស្វែងរក";
  //new movie
  String get upComming => "ភាពយន្តនាពេលខាងមុខ";
  String get newMovie => "ភាពយន្តថ្មីៗ";

  //offerPage.dart
  String get offer => "ការផ្តល់ជូន";
  String get goldenPass => "Golden Pass";
  String get studentOffer => "តម្លៃពិសេសសម្រាប់សិស្សានុសិស្ស និងមនុស្សចាស់។ អនុវត្តនៅថ្ងៃធ្វើការ ចុងសប្តាហ៍ និងថ្ងៃបុណ្យជាតិ";
  String get buy1free1 => "ទិញ 1 ថែម 1 សំបុត្រឥតគិតថ្លៃ!";
  String get cocaDay => "អបអរជាមួយកូកា!";
  String get weekly => "រីករាយជាមួយការបញ្ចុះតម្លៃប្រចាំសប្តាហ៍ដោយគ្រាន់តែចុះឈ្មោះជាអតិថិជន Smart VIP!";
  String get location => "ទីតាំងទាំងអស់"; 
  //fb page
  String get cinema => "ជ្រើសរើសរោងកុន"; 
  //about us 
  String get aboutUs => "អំពីពួកយើង";

  //movie detail
  String get genre => "ប្រភេទ";
  String get duration => "រយៈពេល";
  String get releaseDate => "កាលបរិច្ឆេទចេញផ្សាយ";
  String get classification => "ចំណាត់ថ្នាក់";
  String get showTime => "មើលពេលវេលាចាក់បញ្ចាំង";

    //about us
  String get contactUs => "ទាក់ទងមកពួកយើង";
  String get privacy => "គោលការណ៍ភាព​ ឯកជន";
  String get term => "លក្ខខណ្ឌ";

    //showtime page
  String get timeTicket => "ម៉ោងចាក់បញ្ចាំង និងតម្លៃសំបុត្រ :";
  String get branches => "សាខារោងកុន : ";
  String get screenType =>"ប្រភេទអេក្រង់: ";
}
