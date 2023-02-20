import 'package:get/get.dart';
//
import '../model/salads_model.dart';

class FoodController extends GetxController {
  List<SaladModel> salads = [
    SaladModel(
      id: "1",
      img: "assets/images/1.png",
      title: "Greek Salad",
      subtitle: "Love and Lemons",
      price: 32.00,
      deliveryTime: "15 min",
      description:
          "Greek salad or horiatiki salad is a popular salad in Greek cuisine generally made with pieces of tomatoes, cucumbers, onion, feta cheese, and olives and dressed with salt, pepper, Greek oregano, and olive oil. Common additions include green bell pepper slices or caper berries.",
      quantity: 1,
    ),
    SaladModel(
      id: "2",
      img: "assets/images/spaghetti.png",
      title: "spaghetti",
      subtitle: "A Couple Cooks",
      price: 24.00,
      deliveryTime: "20 min",
      description:
          "Whole-grain pasta can give you all sorts of health benefits. spaghetti is energy-dense, with more than 200 calories per cup.",
      quantity: 1,
    ),
    SaladModel(
      id: "3",
      img: "assets/images/buger.png",
      title: "cheeseburger",
      subtitle: "Absolutely delicious!",
      price: 30.00,
      deliveryTime: "15 min",
      description:
          "cheeseburger calories can add up quickly. While it is best to limit your regular intake of fast food cheeseburgers, there are ways to keep this American favorite in your diet.",
      quantity: 1,
    ),
    SaladModel(
      id: "4",
      img: "assets/images/4.png",
      title: "Healthy Quinoa",
      subtitle: "Foodie Crush",
      price: 29.00,
      deliveryTime: "7 min",
      description:
          "Bright flavor and bold bites are what make this healthy quinoa salad with chickpeas, black beans, mango and avocado in a limey dressing an easy side dish or simple vegetarian meal.",
      quantity: 1,
    ),
  ];

  // For add 1 item from quantityes of Food
  void addQ(int index) {
    if (salads[index].quantity < 9 && salads[index].quantity >= 0) {
      salads[index].quantity++;
    } else {
      Get.snackbar("Notice", "You can't add more than 9 item!");
    }
    update(["quantity"]);
  }

  // For remove 1 item from quantityes of Food
  void removeQ(int index) {
    if (salads[index].quantity > 1 && salads[index].quantity <= 9) {
      salads[index].quantity--;
    } else {
      Get.snackbar("Notice", "You can't order 0 item!");
    }
    update(["quantity"]);
  }
}
