
import 'dart:io';
import 'dart:core';

  
  var name;
  var phone;
  var email;
  var dob;
  var address;
  var account;
  var pin;
  var newPin;
  dynamic balance=0;
  List allCustomers=[];
  

main() {

  print("Good day user. Welcome to DavBank what would you like to do?");
  print("Enter C to create account, P to change pin, D to deposit, W to withdraw, S to show account balance, A for airtime recharge, and X to exit.");

  var res = stdin.readLineSync()?? '';
  print('\n \n');

  void register(){
    print("Good choice! Now you are about to register as our latest customer, kindly and carefully enter your details on prompt.");
    print("What's your fullname?");
    name = stdin.readLineSync()?? '';
    print('\n \n');

    void requestNo(){
      print("What's your Phone number? Example 08160977690");
      phone = stdin.readLineSync()?? '';
      print('\n \n');

      if (phone.length > 11 || phone.length<11) {
      print("Phone number should be 11 digits");
      requestNo();
      }
    }

    requestNo();

    print("What's your email address?");
    email = stdin.readLineSync()?? '';
    print('\n');
    print("What's your date of Birth. Example November 24, 1997?");
    dob = stdin.readLineSync()?? '';
    print('\n');
    print("What's your residential Address?");
    address = stdin.readLineSync()?? '';
    print('\n');
    print("What's type of account do wish to open? Enter C for Current or S for Savings.");
    account = stdin.readLineSync()?? '';

    if (account == "C"||account=="c") {
    account = "Current";
      
    print("Great! You are now being registered on a "+ account + " Account.");
    print('\n \n');
    }
    
    if (account == "S"||account=="s") {
    account = "Savings";
    print("Well done! You are now being registered on a " + account + " Account.");
    print('\n \n');
    }

    void setPin(){
      print("You are to now set your 4 digit pin. Make sure it's safe and easy to remember. Example 0000. Once done press enter.");
      pin = stdin.readLineSync()?? '';
      if (pin.length > 4 || pin.length < 4) {
      print("Your Pin should be 4 digits");
      setPin();
      }
      print("Congratulations! You are all set. Enjoy your best banking services with ease \n \n");

    }

    setPin();

    Map customers = {
      'name' : name,
      'phone': phone,
      'email' : email,
      'dob' : dob,
      'address' : address,
      'account' : account,
      'pin' : pin,
      'balance' : balance
    };

    allCustomers.add(customers,);
    allCustomers.forEach(print);
    // print(allCustomers);
    print('\n \n'); 

  }

  void changePin(){
    print("Now you are about to change your pin. Kindly enter some key details on prompt for verification." );
    print('\n \n');

    print("Your Phone Number?");
    var a = stdin.readLineSync()?? '';
    print('\n \n');
    print("Your Original Pin?");
    var b = stdin.readLineSync()?? '';
    print('\n \n');

    for (int i = 0; i < allCustomers.length; i++) {

      
      if (a == allCustomers[i]['phone'] && b == allCustomers[i]['pin']) {
        print("Enter your new pin");
        newPin = stdin.readLineSync()?? '';
        allCustomers[i]['pin'] = newPin;
        print('Your pin has been successfully changed');
        print(allCustomers);
        print('\n \n');
      }
    }

  }

  void accountBalance(){
    print("Now you are about to check your acount balance. Kindly enter some key details on prompt for verification." );
    print('Your Phone number?');
    var l = stdin.readLineSync()?? '';
    print('\n');
    print("Your 4-digit Pin? ");
    var m = stdin.readLineSync()?? '';
    print('\n');

    for ( int s = 0; s < allCustomers.length; s++) {
        
      if (l == allCustomers[s]['phone'] && m == allCustomers[s]['pin']) {
        print('Your Balance is ${allCustomers[s]['balance']}' + ' naira \n');
        main();
        
      }
    }

  }

  void deposit(){
    print("Now you are about to deposit your fund. Kindly enter some key details on prompt for verification." );

    print("Your Phone Number? Example 08160977690");
    var c = stdin.readLineSync()?? '';
    print("Your 4-digit Pin? ");
    var m = stdin.readLineSync()?? '';
    print('\n');

    for (int s = 0; s < allCustomers.length; s++) {
        
      if (c == allCustomers[s]['phone'] && m == allCustomers[s]['pin']) {
          print("How much do you wish to deposit?");
          int e = int.parse(stdin.readLineSync()?? '');
          allCustomers[s]['balance']+= e;
          print("You have deposited $e Naira only to "+ allCustomers[s]['name']+ "'s " + allCustomers
          [s]['account']+ " account.");
          print('\n \n');
      }

    }

  }

  void withdraw(){
    print("Now you are about to withdraw your fund. Kindly enter some key details on prompt for verification." );
    print("Your Phone Number? Example 08160977690");
    var f = stdin.readLineSync()?? '';
    print('\n \n');
    print("Your 4-digit Pin?");
    var g = stdin.readLineSync()?? '';
    print('\n \n');

    for (int s = 0; s < allCustomers.length; s++) {
        
        if (f == allCustomers[s]['phone'] && g == allCustomers[s]['pin']) {
          print("How much do you wish to withdraw?");
          int h = int.parse(stdin.readLineSync()?? '');
          
          if (allCustomers[s]['balance']>=h) {
            
            allCustomers[s]['balance']-= h;
            print("You have withdrawn  $h  Naira only from " + allCustomers[s]['name']+ "'s " + allCustomers
          [s]['account']+ " account.");
            print(allCustomers[s]['balance']);
            print('\n \n');
            main();
          }else{
            print('Insufficient fund, try another amount');
            withdraw();
          }
        
        }
      }
  }

  void airtime(){
    print("Now you are about to purchase airtime. Kindly enter some key details on prompt for verification." );

    print("Your Phone Number? Example 08160977690");
    var i = stdin.readLineSync()?? '';
    print('\n');
    print("Your 4-digit Pin?");
    var j = stdin.readLineSync()?? '';
    print('\n\n');

    for (int s = 0; s < allCustomers.length; s++) {
        
      if (i == allCustomers[s]['phone'] && j == allCustomers[s]['pin']) {
        print("How much airtime do you wish to purchase?");
        var k = int.parse(stdin.readLineSync()?? '');
        allCustomers[s]['balance']-= k;
        print('\n\n');
        print("You have purshased $k Naira airtime from " + allCustomers[s]['name']+ "'s " + allCustomers
        [s]['account']+ " account.");
        print('\n\n');
      }
    }

  }

  if (res == "C"||res=='c') {
    register();
    main();
  }

  if (res == "X"||res=='x') {
   return;
  }

  if (res == "P"||res=='p') {
    changePin();
    main();
  }

  if (res == "S"||res=='s') {
    accountBalance();
    main();
  }
  
  if (res == "D"||res=='d') {
    deposit();
    main();
  }

  if (res == "A"||res=='a') {
    airtime();
    main();
  }

  if (res == "W"||res=='w') {
    withdraw();
    main();
  }

  

  

  

  

  
}