import 'export_general.dart';

class CustomFieldComponents extends StatelessWidget {
  final String hint;
  final String? suffixIconSvg;
  final String? prefixIconSvg;
  final TextEditingController controller;
  final VoidCallback? onpressed;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? labelWidget;
  final bool enabled;
  final Color? hintColor;
  const CustomFieldComponents({
    Key? key,
    required this.hint,
    this.hintColor,
    this.suffixIconSvg,
    this.enabled = false,
    this.inputFormatters,
    this.prefixIconSvg,
    this.onpressed,
    this.validator,
    this.labelWidget,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: enabled,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyboardType,
      cursorColor: AppColor.KBlacks,
      style: GoogleFonts.dmSans(
        fontSize: 14.sp,
        color: AppColor.KBlacks,
        fontWeight: FontWeight.w400,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        label: labelWidget,
        filled: true,
        fillColor: AppColor.kWhiteColor,
        contentPadding: EdgeInsets.symmetric(vertical: 16.sp),
        focusColor: Colors.white,
        hintText: hint,
        hintStyle: GoogleFonts.dmSans(
          fontSize: 14.sp,
          color: hintColor ?? AppColor.KBlacks,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIconSvg != null
            ? Padding(
                padding: EdgeInsets.only(left: 12, right: 8),
                child: SvgPicture.asset(
                  prefixIconSvg!,
                  width: 24,
                  height: 24,
                  color: AppColor.KBlacks,
                ),
              )
            : null,
        suffixIcon: suffixIconSvg != null
            ? Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                  onPressed: onpressed,
                  icon: SvgPicture.asset(
                    suffixIconSvg!,
                    color: AppColor.KBlacks,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Color(0xffE2E4EA),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColor.KBlacks,
          ),
        ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.red),
        //   borderRadius: BorderRadius.circular(15.0.r),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Color(0xffE2E4EA),
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red, height: 0),
      ),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
