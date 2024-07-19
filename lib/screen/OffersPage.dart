import 'package:flutter/material.dart';
import 'package:clone_app/widgets/CustomNavBar.dart'; // Ensure correct import path
import 'OfferDetailsPage.dart'; // Import the new page

import 'package:provider/provider.dart';
import 'package:clone_app/setting/language_logic.dart';
import 'package:clone_app/setting/theme_logic.dart';
class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
  var languageLogic = context.watch<LanguageLogic>();
  var theme = Theme.of(context);
  bool isDarkMode = theme.brightness == Brightness.dark;   
    return Scaffold(
      //backgroundColor: Colors.black, // Set the background color here
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Legend ",
                                style: TextStyle(
                                  color:isDarkMode? Colors.white : Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Cinema",
                                style: TextStyle(
                                  color: Color(
                                      0xFF9D1C1F), // Change text color to #9D1C1F
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
              // Replace the search box with an image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'images/offer6.jpg',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${languageLogic.lang.offer}",
                      style: TextStyle(
                        // color: Colors.white,
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // Added SizedBox for spacing
              _buildOffers(context), // Pass context to _buildOffers
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(
        selectedIndex: 1, // Example: Set your selected index here
        onTap: (index) {
          // Handle navigation based on the index
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/offersPage');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/locationPage');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/developerPage');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/settingPage');
          }
        },
      ),
    );
  }

  Widget _buildOffers(BuildContext context) {
  var languageLogic = context.watch<LanguageLogic>();
  var theme = Theme.of(context);
  bool isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      children: [
        _buildOffer(
          context: context, // Pass context to _buildOffer
          imagePath: "images/offers1.jpg",
          title: "${languageLogic.lang.goldenPass}",
          description: '''
Campaign Mechanism:
- Title: GOLDEN PASS
- Sale Date: from 7th – 31st  JULY 2024
- Price of a pass = \$13.13
- Validity Date: from 7th – 31st  JULY 2024

Terms & Conditions:
- This golden pass card is eligible for a maximum redemption of 5 tickets total.
- This golden pass card is valid for all movies at your location.
- This golden pass card is valid for 2D movies redemption only.
- This golden pass card is valid for any day (Weekday & weekend)
- This golden pass card can redeemed for advance ticket (available within period promotion only)
- This golden pass card is valid for regular seat only.
- This golden pass card is not valid for Screen X, Atmos, Gold Class & Diamond Class.
- This golden pass card is non-refundable and cannot be exchanged for cash in part or full.
- This golden pass card cannot be combined in conjunction with any other sales discount or promotion offers.
- This golden pass card is redeemable at all locations, Legend Cinema, Legend Premium & Legend 271 mega mall.
- No compensation , replacement , or refund will be given for any damaged or defaced movie pass accepted by Legend Cinema (Company)
- Company will not be responsible for any lost or stolen card.
          ''',
        ),
        _buildOffer(
          context: context,
          imagePath: "images/offer2.jpg",
          title: "${languageLogic.lang.cocaDay}",
          description: '''
Get a Free Refill Every Thursday during the second week of the month! 🥤🥤🥤🤩
Simply purchase a medium or large Coca-Cola and enjoy a free refill of a medium-sized Coca-Cola.Here are the details:
🥤 Free refill available once time only.
🥤 Exclusive for paying via membership only.
🥤 Offer valid at all Legend Cinemas and Legend Premium Cinemas (excluding Legend 271 Mega Mall).
Don't miss out on this special deal! Head to any Legend Cinemas or Legend Premium Cinemas (except Legend 271 Mega Mall) and take advantage of this offer. Remember, it's a one-time-only opportunity, so make sure to grab yours! See you there! 🎬🥤
        ''',
        ),
        _buildOffer(
          context: context,
          imagePath: "images/offer3.jpg",
          title:
              "${languageLogic.lang.studentOffer}",
          description: '''
Terms &Conditions :
- This rate card applies for weekday, weekday, and public holiday
- Students are required to show student ID (valid for grade 12 and below)
- Senior Citizens are required to show National ID (valid for age 60 & above)
- Not applicable for special formats such as Screen X, Gold, or Diamond Class.
- Effective Date from 15th February 2024
- Limited to one ticket per person per day
- Price will vary for selected blockbuster movies and formats.
''',
        ),
        _buildOffer(
          context: context,
          imagePath: "images/offer4.jpg",
          title: "${languageLogic.lang.buy1free1}",
          description: '''
PROMOTION: MEMBERSHIP CARD | BUY 1 GET 1 ON TUESDAY 2024 
Find the information below:
•Promotion Title:  Every Tuesday Buy 1 Get 1 Ticket Via Membership Card. 
•Period Date:   09 JANUARY - 31 DECEMBER 2024. 
•Location:  All locations, and Legend 271 Maga Mall. 
NEW TERMS &CONDITIONS :
- This promotion applies to all movies at that location. 
- This promotion applies to single seats only.
- This promotion is applicable via membership card only. 
- This promotion is applicable every Tuesday only, except Public Holiday. 
- This promotion is applicable at all halls, excluding VIP (Gold class & Diamond Class) and special formats such as screen X, or Dolby Atmos and CH sub
- This promotion is applicable on 2D & 3D movie ticket only. 
- One membership card can get a promotion only once a day.
''',
        ),
        _buildOffer(
          context: context,
          imagePath: "images/offers5.jpg",
          title:
              "${languageLogic.lang.weekly}",
          description: '''
Become a Smart VIP subscriber to enjoy discounts on tickets, food, and soft drinks.
- Discount 15% on movie tickets and F&B at any Legend cinemas from Monday to Wednesday.
- Discount 10% on movie tickets and F&B at any Legend cinemas from Thursday to Sunday.
- Location: Apply All Locations, except Legend 271 Mega Mall. 
Term & Condition:
• Apply for all movies.
• Apply for all ShowTime.
• Apply for all types of seats.
• Apply for all Smart VIP subscribers.
• Apply for purchasing at the ticket counter only.
• Accept all payments, except membership cards.
• Apply for all Smart Hall, except VIP Hall (Gold Class & Diamond Class). 
• Customers can use a promotion once a day for one ticket only.
''',
        ),
      ],
    );
  }

  Widget _buildOffer({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String description,
  }) {
    var languageLogic = context.watch<LanguageLogic>();
    var theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;    
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10), // Adjusted padding
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OfferDetailsPage(
                imagePath: imagePath,
                title: title,
                description: description,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity, // Set width to fill the container
          decoration: BoxDecoration(
            // color: const Color(0xFF292837),
            color: isDarkMode ? Color(0xFF292837) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF292837).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 10), // Added padding
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath,
                    height: 200, // Height remains the same
                    width: double.infinity, // Set width to fill the container
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    // color: Colors.white,
                    color: isDarkMode ?Colors.white : Color(0xFF292837),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
