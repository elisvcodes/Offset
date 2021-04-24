/*generate dummy data*/
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_sustainability/models/image_obj.dart';
import 'package:api_sustainability/models/model_image.dart';
import 'package:api_sustainability/models/music_song.dart';
import 'package:api_sustainability/models/news.dart';
import 'package:api_sustainability/models/people.dart';
import 'package:api_sustainability/models/shop_category.dart';
import 'package:api_sustainability/models/shop_product.dart';
import 'package:api_sustainability/models/wizard.dart';

import 'img.dart';

class Dummy {
  static Random random = new Random();

  static const List<String> images = [
    "image_1.jpg",
    "image_2.jpg",
    "image_3.jpg",
    "image_4.jpg",
    "image_5.jpg",
    "image_6.jpg",
    "image_7.jpg",
    "image_8.jpg",
    "image_9.jpg",
    "image_10.jpg",
    "image_11.jpg",
    "image_12.jpg",
    "image_13.jpg",
    "image_14.jpg",
  ];

  static const List<String> images_name = [
    "Night Street",
    "Architect Desk",
    "City Building",
    "Computer Keyboard",
    "Grunge Window",
    "Park Bench",
    "Table Cocktails",
    "Side Park",
    "Hanging Clothes",
    "Coffee Camera",
    "Morning Flower",
    "Foggy Hill",
    "The Backpacker",
    "River Forest",
    "Mist Mountain",
  ];

  static const List<String> general_date = [
    "05 Dec 2015",
    "22 Apr 2013",
    "14 Sep 2015",
    "11 Feb 2015",
    "29 Aug 2014",
    "10 Nov 2015",
    "23 Jun 2015",
    "20 Jul 2015",
    "09 Mar 2015",
    "01 Jan 2016",
  ];

  static const List<String> peopleNames = [
    "Anderson Thomas",
    "Adams Green",
    "Laura Michelle",
    "Betty L",
    "Miller Wilson",
    "Roberts Turner",
    "Garcia Lewis",
    "Mary Jackson",
    "Kevin John",
    "Evans Collins",
    "Sarah Scott",
    "Elizabeth",
    "Roberts",
    "Anthony C",
    "Susan Lee"
  ];

  static const List<String> peopleImages = [
    "photo_male_1.jpg",
    "photo_male_2.jpg",
    "photo_female_1.jpg",
    "photo_female_2.jpg",
    "photo_male_3.jpg",
    "photo_male_4.jpg",
    "photo_female_3.jpg",
    "photo_female_4.jpg",
    "photo_male_5.jpg",
    "photo_male_6.jpg",
    "photo_female_5.jpg",
    "photo_female_6.jpg",
    "photo_male_7.jpg",
    "photo_male_8.jpg",
    "photo_female_7.jpg"
  ];

  static const List<String> month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  //  shop data ----------------------------------------------------------------

  static const List<String> shop_category_title = [
    "Gadgets and Computers",
    "Fashion",
    "Beauty and Health",
    "Babies and Kids",
    "Home and Garden",
    "Sports and Hobby",
    "Ticket and Voucher",
    "Service and Food"
  ];

  static const List<String> shop_category_brief = [
    "100k Items",
    "655k Items",
    "221k Items",
    "85k Items",
    "725k Items",
    "932k Items",
    "475k Items",
    "362k Items"
  ];

  static const List<String> shop_category_img = [
    "image_4.jpg",
    "image_19.jpg",
    "image_20.jpg",
    "image_21.jpg",
    "image_8.jpg",
    "image_22.jpg",
    "image_23.jpg",
    "image_24.jpg",
  ];

  static const List<IconData> shop_category_icon = [
    Icons.devices,
    Icons.accessibility,
    Icons.face,
    Icons.child_friendly,
    Icons.weekend,
    Icons.pool,
    Icons.confirmation_number,
    Icons.restaurant
  ];

  //  header auto data ---------------------------------------------------------

  static const List<String> images_header_auto = [
    "image_12.jpg",
    "image_13.jpg",
    "image_14.jpg",
    "image_15.jpg",
    "image_8.jpg"
  ];

  static const List<String> title_header_auto = [
    "Dui fringilla ornare finibus, orci odio",
    "Mauris sagittis non elit quis fermentum",
    "Mauris ultricies augue sit amet est sollicitudin",
    "Suspendisse ornare est ac auctor pulvinar",
    "Vivamus laoreet aliquam ipsum eget pretium",
  ];
  static const List<String> subtitle_header_auto = [
    "Foggy Hill",
    "The Backpacker",
    "River Forest",
    "Mist Mountain",
    "Side Park",
  ];

  //  wizard data --------------------------------------------------------------

  static const List<String> wizard_title = [
    "Ready to Travel",
    "Pick the Ticket",
    "Flight to Destination",
    "Enjoy Holiday"
  ];
  static const List<String> wizard_brief = [
    "Choose your destination, plan Your trip. Pick the best place for Your holiday",
    "Select the day, pick Your ticket. We give you the best prices. We guarantee!",
    "Safe and Comfort flight is our priority. Professional crew and services.",
    "Enjoy your holiday, Don't forget to feel the moment and take a photo!",
  ];
  static const List<String> wizard_image = [
    "img_wizard_1.png",
    "img_wizard_2.png",
    "img_wizard_3.png",
    "img_wizard_4.png",
  ];
  static const List<String> wizard_background = [
    "image_15.jpg",
    "image_10.jpg",
    "image_3.jpg",
    "image_12.jpg"
  ];
  static const List<Color> wizard_color = [
    Colors.red,
    Colors.blueGrey,
    Colors.purple,
    Colors.orange,
  ];

  // news data -----------------------------------------------------------------

  static const List<String> all_images = [
    "image_1.jpg",
    "image_2.jpg",
    "image_3.jpg",
    "image_4.jpg",
    "image_5.jpg",
    "image_6.jpg",
    "image_7.jpg",
    "image_8.jpg",
    "image_9.jpg",
    "image_10.jpg",
    "image_11.jpg",
    "image_12.jpg",
    "image_13.jpg",
    "image_14.jpg",
    "image_15.jpg",
    "image_16.jpg",
    "image_17.jpg",
    "image_18.jpg",
    "image_19.jpg",
    "image_20.jpg",
    "image_21.jpg",
    "image_22.jpg",
    "image_23.jpg",
    "image_24.jpg",
    "image_25.jpg",
    "image_26.jpg",
    "image_27.jpg",
    "image_28.jpg",
    "image_29.jpg",
    "image_30.jpg",
  ];

  static const List<String> strings_medium = [
    "Proin commodo porttitor felis. Integer auctor nulla faucibus tempus. In at viverra tellus.",
    "Cras at lobortis velit. In eu turpis euismod dolor feugiat placerat gravida a ante. Duis consequat massa.",
    "Praesent eleifend ipsum sapien, vel molestie nibh blandit et. Duis accumsan dignissim velit.",
    "Aliquam in risus nibh. Pellentesque lacinia nisi ac est porta, nec eros luctus. Phasellus dictum ornare.",
    "In rutrum turpis felis. Ut sodales libero non nibh convallis, ac vehicula tellus laoreet.",
    "Etiam faucibus ante tortor, nec eros lacinia ut. Proin facilisis cursus enim, at congue lorem iaculis ut.",
    "Duis sodales ligula non scelerisque molestie. In hac habitasse platea dictumst. Donec tempor nibh.",
    "Quisque ac ante et purus auctor iaculis at sed erat. Duis vestibulum elit et mollis.",
    "Maecenas quis posuere leo. Duis ut tortor vitae nisi commodo dictum. Quisque ac ante et purus auctor.",
    "Proin commodo porttitor felis. Integer auctor nulla tincidunt faucibus tempus. In at viverra tellus.",
  ];

  static const List<String> news_category = [
    "Politics",
    "Entertainment",
    "Science",
    "Sport",
    "Business",
    "Technology",
  ];
  static const List<String> full_date = [
    "Sun, 05 Dec 15, 11:30 AM",
    "Mon, 22 Apr 13, 06:12 PM",
    "Wed, 14 Sep 15, 09:21 PM",
    "Fri, 11 Feb 15, 11:42 PM",
    "Thu, 29 Aug 14, 02:30 AM",
    "Sat, 10 Nov 15, 07:05 PM",
    "Tue, 23 Jun 15, 09:24 AM",
    "Wed, 20 Jul 15, 08:35 AM",
    "Sun, 09 Mar 15, 12:49 PM",
    "Mon, 01 Jan 16, 10:50 PM",
  ];

  // shop product data ---------------------------------------------------------

  static const List<String> shop_product_image = [
    "image_shop_1.jpg",
    "image_shop_2.jpg",
    "image_shop_3.jpg",
    "image_shop_4.jpg",
    "image_shop_5.jpg",
    "image_shop_6.jpg",
    "image_shop_7.jpg",
    "image_shop_8.jpg",
  ];
  static const List<String> shop_product_title = [
    "Fashion B07 Keara 933",
    "Coup Hoodie Jacket",
    "Gala Suede Jacket Flower",
    "Qonnoq Checked Blouse",
    "Java Seven Belladji 674",
    "Kanvas Sneaker Shoes",
    "Clarks Idamarie Faye Lea",
    "Piero Rush Women",
  ];
  static const List<String> shop_product_price = [
    "\$ 48.90",
    "\$ 89.00",
    "\$ 66.80",
    "\$ 34.50",
    "\$ 44.90",
    "\$ 59.00",
    "\$ 78.20",
    "\$ 96.00",
  ];

  // music data ----------------------------------------------------------------

  static const List<String> album_cover = [
    "image_20.jpg",
    "image_2.jpg",
    "image_3.jpg",
    "image_4.jpg",
    "image_21.jpg",
    "image_16.jpg",
    "image_7.jpg",
    "image_17.jpg",
    "image_18.jpg",
    "image_10.jpg",
    "image_11.jpg",
    "image_12.jpg",
    "image_19.jpg",
    "image_14.jpg",
    "image_15.jpg",
  ];

  static const List<String> song_name = [
    "All The Arguments",
    "Proud of You",
    "Morning Reasons",
    "Drowsy Smart Mouth",
    "Being Anything Else",
    "Fist Full Of Mysteries",
    "5 Dollar Town",
    "Eternal Soul",
    "Living is Going Down",
    "Deadly Joy",
    "Screaming Skill",
    "Escape Of The Justice",
    "Silent Fight",
    "Distractions Have No Answers",
    "Lead Sm",
  ];

  static const List<String> album_name = [
    "The Mother",
    "Not Advance",
    "Coming Back",
    "Suspicions",
    "Desert Of Lost",
    "Glances",
    "Some Doubts",
    "Morning",
    "Love More Deeply",
    "Quite",
    "Backseat",
    "Peace",
    "Ambitions",
    "Knocking At",
    "Synchronisation",
  ];

  static List<String> getNatureImages([int count = 14]) {
    List<String> natureImages = [];
    for (String s in images) {
      natureImages.add(Img.get(s));
    }
    natureImages.shuffle();
    return natureImages.sublist(0, count);
  }

  static List<People> getPeopleData() {
    List<People> items = [];

    for (int i = 0; i < peopleNames.length; i++) {
      People obj = new People();
      obj.image = Img.get(peopleImages[i]);
      obj.name = peopleNames[i];
      obj.email = getEmailFromName(obj.name);
      items.add(obj);
    }
    items.shuffle();
    return items;
  }

  static List<String> getStringsMonth() {
    List<String> items = [];
    for (String s in month) items.add(s);
    return items;
  }

  static String getEmailFromName(String name) {
    if (name.isNotEmpty) {
      String email = name.replaceAll(" ", ".").toLowerCase() + "@mail.com";
      return email;
    }
    return name;
  }

  static List<ShopCategory> getShoppingCategory() {
    List<ShopCategory> items = [];
    for (int i = 0; i < shop_category_title.length; i++) {
      ShopCategory obj = new ShopCategory();
      obj.icon = shop_category_icon[i];
      obj.image = shop_category_img[i];
      obj.title = shop_category_title[i];
      obj.brief = shop_category_brief[i];
      items.add(obj);
    }
    return items;
  }

  static List<ModelImage> getModelImage() {
    final List<ModelImage> items = [];
    for (int i = 0; i < images_header_auto.length; i++) {
      ModelImage obj = new ModelImage();
      obj.image = images_header_auto[i];
      obj.name = title_header_auto[i];
      obj.brief = subtitle_header_auto[i];
      items.add(obj);
    }
    return items;
  }

  static List<ImageObj> getImageDate() {
    List<ImageObj> items = [];
    for (int i = 0; i < images.length; i++) {
      ImageObj obj = new ImageObj();
      obj.image = images[i];
      obj.name = images_name[i];
      obj.brief = general_date[random.nextInt(general_date.length)];
      obj.counter = random.nextBool() ? random.nextInt(500) : -1;
      items.add(obj);
    }
    items.shuffle();
    return items;
  }

  static List<Wizard> getWizard() {
    List<Wizard> items = [];
    for (int i = 0; i < wizard_title.length; i++) {
      Wizard obj = new Wizard();
      obj.image = wizard_image[i];
      obj.background = wizard_background[i];
      obj.title = wizard_title[i];
      obj.brief = wizard_brief[i];
      obj.color = wizard_color[i];
      items.add(obj);
    }
    return items;
  }

  static List<News> getNewsData(int count) {
    List<News> items = [];
    for (int i = 0; i < count; i++) {
      News obj = new News();
      obj.image = all_images[random.nextInt(all_images.length)];
      obj.title = strings_medium[random.nextInt(strings_medium.length)];
      obj.subtitle = news_category[random.nextInt(news_category.length)];
      obj.date = full_date[random.nextInt(full_date.length)];
      items.add(obj);
    }
    return items;
  }

  static List<ShopProduct> getShoppingProduct() {
    List<ShopProduct> items = [];
    for (int i = 0; i < shop_product_image.length; i++) {
      ShopProduct obj = new ShopProduct();
      obj.image = shop_product_image[i];
      obj.title = shop_product_title[i];
      obj.price = shop_product_price[i];
      items.add(obj);
    }
    items.shuffle();
    return items;
  }

  static List<MusicSong> getMusicSong() {
    List<MusicSong> items = [];
    for (int i = 0; i < album_cover.length; i++) {
      MusicSong obj = new MusicSong();
      obj.image = album_cover[i];
      obj.title = song_name[i];
      obj.brief = album_name[i];
      items.add(obj);
    }
    items.shuffle();
    return items;
  }
}
