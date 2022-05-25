import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  late EmailAuth emailAuth;
   bool? res = false;
  @override
void initState(){
  super.initState();
  emailAuth = EmailAuth(sessionName: "Sample Session");
}

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(recipientMail: _emailController.value.text, otpLength: 5);
  if (result){
    // setState(() {
    //   // submitValid = true;
    // });
    print("OTP Sent");
  }
  else {print('OTP is not sent');}
  }
  void verifyOtp (){
    res = emailAuth.validateOtp(recipientMail: _emailController.text, userOtp: _otpController.text);
    print(emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.value.text));
  if (res == true ){print('OTP is verified');}
  else {print('Invalid OTP');}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                labelText: 'Email',
                suffixIcon: TextButton(
                    onPressed: () => sendOtp() , child: const Text('Send OTP'))
                //border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Plz! Enter your Email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'OTP Code',
                hintText: 'Enter OTP'
                //border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Verify Your Email!';
                }
                return null;
              },
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  setState(() {
                    verifyOtp();
                    res == true;
                  });
                }
              },
              child: const Text('Verify OTP'),
            ),
            //using a ternary operator to show another widget.
            ///it needs the use of setstate cuz initially the res is false.
            res == false
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(

                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 24.0,
                ),
                label: Text('OTP Verified', style: TextStyle(color: Colors.black),),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,

                    // onPrimary: Colors.white,

                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(16.0),
                    // )
                ),
              ),
            )
            ///ternary operator else statement.
                :Container(),
          // : Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ElevatedButton.icon(
          //       icon: const Icon(
          //         Icons.close,
          //         color: Colors.red,
          //         size: 24.0,
          //       ),
          //       label: Text('OTP Not Verified'),
          //       onPressed: () { print("Not Verified"); },
          //       style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(16.0),
          //           )
          //       ),
          //     ),
          // )


          ],
        ),
      ),
    );
  }
}