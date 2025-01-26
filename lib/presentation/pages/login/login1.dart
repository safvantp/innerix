import 'package:ecom/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatelessWidget {
  loginpage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
Widget build(BuildContext context) {
  final controller = Get.find<LoginController>();
  final size = MediaQuery.of(context).size;

  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            const Spacer(flex: 1),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                richText(24), 
                const SizedBox(height: 16),
                ANOTHOR_richText(10),
                const SizedBox(height: 40),

                Text(
                  'Email',
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                emailTextField(size),
                const SizedBox(height: 16),

                Text(
                  'Password',
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                passwordTextField(size),
              ],
            ),
            const SizedBox(height: 10),


            keepSigned_ForgetSection(),
            const SizedBox(height: 16),

            signInButton(size, controller),
                        const SizedBox(height: 16),
                        signInGoogleFacebookButton(size, ),



             const Spacer(flex: 2),
            buildFooter(size),
          ],
        ),
      ),
    ),
  );
}


  

  Widget richText(double fontSize) {
  return Text.rich(
    TextSpan(
      style: GoogleFonts.inter(
        fontSize: fontSize, 
        color: Colors.black,
        letterSpacing: 2.0,
      ),
      children: const [
        TextSpan(
          text: 'Sign in to your\n',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        TextSpan(
          text: 'Account', 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.left, 
  );
}
Widget ANOTHOR_richText(double fontSize) {
  return Text.rich(
    TextSpan(
      style: GoogleFonts.inter(
        fontSize: fontSize, 
            // color: Colors.black87,
        letterSpacing: 1.0,
      ),
      children: const [
        TextSpan(
          text: 'Enter your email and password',
          style: TextStyle(
          ),
        ),
        TextSpan(
          text: ' to login in',  
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}

  Widget emailTextField(Size size) {
    return SizedBox(
      height: size.height / 13,
      child: TextField(
        controller: emailController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter your email',
          hintStyle: GoogleFonts.inter(
            fontSize: 14.0,
            color: const Color(0xFFABB3BB),
            height: 1.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget passwordTextField(Size size) {
  bool _isObscured = true; 
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: size.height / 13,
        child: TextField(
          controller: passwordController,
          obscureText: _isObscured, 
          style: GoogleFonts.inter(
            fontSize: 18.0,
            color: const Color(0xFF151624),
          ),
          maxLines: 1,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: const Color(0xFF151624),
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: GoogleFonts.inter(
              fontSize: 14.0,
              color: const Color(0xFFABB3BB),
              height: 1.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFFABB3BB),
                size: 20.0,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured; 
                });
              },
            ),
          ),
        ),
      );
    },
  );
}

  Widget keepSigned_ForgetSection() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'Forgot password?',
            style: GoogleFonts.inter(
              fontSize: 12.0,
              color: const Color.fromARGB(255, 78, 45, 2),
              fontWeight: FontWeight.w600,
              height: 1.17,
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }

  Widget signInButton(Size size, LoginController controller) {
    return Obx(() => GestureDetector(
          onTap: () {
            if (!controller.isLoading.value) {
              controller.login(
                emailController.text,
                passwordController.text,
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: size.height / 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color:  const Color.fromARGB(255, 232, 153, 51),
            ),
            child: controller.isLoading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    'Log In',
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ));
  }

  

  Widget signInGoogleFacebookButton(Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        width: size.width / 0.8,
        height: size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFEFEFEF),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.string(
              '<svg viewBox="-3.0 0.0 22.92 22.92" ><path transform="translate(-3.0, 0.0)" d="M 22.6936149597168 9.214142799377441 L 21.77065277099609 9.214142799377441 L 21.77065277099609 9.166590690612793 L 11.45823860168457 9.166590690612793 L 11.45823860168457 13.74988651275635 L 17.93386268615723 13.74988651275635 C 16.98913192749023 16.41793632507324 14.45055770874023 18.33318138122559 11.45823860168457 18.33318138122559 C 7.661551475524902 18.33318138122559 4.583295345306396 15.25492572784424 4.583295345306396 11.45823860168457 C 4.583295345306396 7.661551475524902 7.661551475524902 4.583295345306396 11.45823860168457 4.583295345306396 C 13.21077632904053 4.583295345306396 14.80519008636475 5.244435787200928 16.01918983459473 6.324374675750732 L 19.26015281677246 3.083411931991577 C 17.21371269226074 1.176188230514526 14.47633838653564 0 11.45823860168457 0 C 5.130426406860352 0 0 5.130426406860352 0 11.45823860168457 C 0 17.78605079650879 5.130426406860352 22.91647720336914 11.45823860168457 22.91647720336914 C 17.78605079650879 22.91647720336914 22.91647720336914 17.78605079650879 22.91647720336914 11.45823860168457 C 22.91647720336914 10.68996334075928 22.83741569519043 9.940022468566895 22.6936149597168 9.214142799377441 Z" fill="#ffc107" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-1.68, 0.0)" d="M 0 6.125000953674316 L 3.764603137969971 8.885863304138184 C 4.78324031829834 6.363905429840088 7.250198841094971 4.583294868469238 10.13710117340088 4.583294868469238 C 11.88963890075684 4.583294868469238 13.48405265808105 5.244434833526611 14.69805240631104 6.324373722076416 L 17.93901443481445 3.083411693572998 C 15.89257335662842 1.176188111305237 13.15520095825195 0 10.13710117340088 0 C 5.735992908477783 0 1.919254422187805 2.484718799591064 0 6.125000953674316 Z" fill="#ff3d00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-1.74, 13.78)" d="M 10.20069408416748 9.135653495788574 C 13.16035556793213 9.135653495788574 15.8496036529541 8.003005981445312 17.88286781311035 6.161093711853027 L 14.33654403686523 3.160181760787964 C 13.14749050140381 4.064460277557373 11.69453620910645 4.553541660308838 10.20069408416748 4.55235767364502 C 7.220407009124756 4.55235767364502 4.689855575561523 2.6520094871521 3.736530303955078 0 L 0 2.878881216049194 C 1.896337866783142 6.589632034301758 5.747450828552246 9.135653495788574 10.20069408416748 9.135653495788574 Z" fill="#4caf50" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(8.46, 9.17)" d="M 11.23537635803223 0.04755179211497307 L 10.31241607666016 0.04755179211497307 L 10.31241607666016 0 L 0 0 L 0 4.583295345306396 L 6.475625038146973 4.583295345306396 C 6.023715496063232 5.853105068206787 5.209692478179932 6.962699413299561 4.134132385253906 7.774986743927002 L 4.135851383209229 7.773841857910156 L 7.682177066802979 10.77475357055664 C 7.431241512298584 11.00277233123779 11.45823955535889 8.020766258239746 11.45823955535889 2.291647672653198 C 11.45823955535889 1.523372769355774 11.37917804718018 0.773431122303009 11.23537635803223 0.04755179211497307 Z" fill="#1976d2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 22.92,
              height: 22.92,
            ),
            const SizedBox(
              width: 16,
            ),
            Center(
              child: Text(
                'Continue with Google',
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ), // Add vertical spacing between buttons
      Container(
        alignment: Alignment.center,
        width: size.width / 0.8,
        height: size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFEFEFEF),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(
              '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" id="facebook">  <path fill="#1877f2" d="M1024,512C1024,229.23016,794.76978,0,512,0S0,229.23016,0,512c0,255.554,187.231,467.37012,432,505.77777V660H302V512H432V399.2C432,270.87982,508.43854,200,625.38922,200,681.40765,200,740,210,740,210V336H675.43713C611.83508,336,592,375.46667,592,415.95728V512H734L711.3,660H592v357.77777C836.769,979.37012,1024,767.554,1024,512Z"></path>  <path fill="#fff" d="M711.3,660,734,512H592V415.95728C592,375.46667,611.83508,336,675.43713,336H740V210s-58.59235-10-114.61078-10C508.43854,200,432,270.87982,432,399.2V512H302V660H432v357.77777a517.39619,517.39619,0,0,0,160,0V660Z"></path></svg>',
              width: 22.92,
              height: 22.92,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Continue with  Facebook',
              style: GoogleFonts.inter(
                fontSize: 14.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ],
  );
}


  Widget buildFooter(Size size) {
    return Center(
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.inter(
            fontSize: 12.0,
            color: Colors.black,
          ),
          children: const [
            TextSpan(
              text: 'Don’t have an account? ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'Sign Up ',
              style: TextStyle(
              color: const Color.fromARGB(255, 78, 45, 2),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
