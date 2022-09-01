import 'package:flutter/material.dart';

String greeting() {
  var hour = TimeOfDay.now().hour;

  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

String signInSuccess = 'Hello, Good ${greeting()} User';

String addToCartSuccess = 'Add To Cart Success, you can look in your Cart';

String updateSuccess = 'Update Success';
