import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
    });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  //text editing contollers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();


  //register method
  void register() async{
    
    //get auth service
    final _authService = AuthService();

    //check if passwords match -> create user
    if(passwordController.text == confirmPasswordController.text){
      //try creating user
      try{
        await _authService.signUpWithEmailPassword(
          emailController.text, passwordController.text);
      }

      //display any errors
      catch(e){
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
          );
      }
    }

    //if passwords don't match -> show error
    else{
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match!"),
        ),
        );
    }


    // showDialog(
    //   context: context, 
    //   builder: (context) => AlertDialog(
    //     backgroundColor: Theme.of(context).colorScheme.background,
    //     title: Text("User wants to register"),
    //   ),
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
        
            //message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
        
            //email textfield
            MyTextField(
              controller: emailController, 
              hintText: "Email", 
              obscureText: false,
              ),
              const SizedBox(height: 10),

        
            //password textfield
            MyTextField(
              controller: passwordController, 
              hintText: "Password", 
              obscureText: true,
              ),
              const SizedBox(height: 25),

              //confirm password textfield
            MyTextField(
              controller: confirmPasswordController, 
              hintText: "Confirm password", 
              obscureText: true,
              ),
              const SizedBox(height: 25),
        
            //sign up button
            MyButton(
              ontap: register, 
              text: "Sign up"
              ),
              const SizedBox(height: 25),
        
            //Already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}