import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_mkh/core/constants/app_constants.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ScreenUtil allows adapting to screen size
    final isDesktop = ScreenUtil().screenWidth > 800;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image Placeholder
            CircleAvatar(
                  radius: isDesktop ? 80 : 60.r,
                  backgroundImage: const AssetImage(
                    AppConstants.profilePlaceholder,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                )
                .animate()
                .slideY(
                  begin: -1, // From Top
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOutBack,
                )
                .fadeIn(duration: 600.ms), // Animation

            SizedBox(height: 30.h),

            // Greeting
            Text(
                  'Hello, I\'m Kamran Hashmi',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: isDesktop ? 60 : 36.sp,
                  ),
                  textAlign: TextAlign.center,
                )
                .animate()
                .slideX(
                  begin: -1, // From Left
                  end: 0,
                  delay: 200.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(delay: 200.ms, duration: 600.ms),

            SizedBox(height: 10.h),

            // Subtitle
            Text(
                  'Flutter Developer | Building Modern Mobile & Web Applications',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.color?.withValues(alpha: 0.8),
                    fontSize: isDesktop ? 24 : 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                )
                .animate()
                .slideX(
                  begin: 1, // From right
                  end: 0,
                  delay: 400.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(delay: 400.ms, duration: 600.ms),

            SizedBox(height: 50.h),

            // Buttons
            Wrap(
                  spacing: 20.w,
                  runSpacing: 20.h,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.go('/projects'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 40 : 40.w,
                          vertical: isDesktop ? 20 : 15.h,
                        ),
                        textStyle: TextStyle(
                          fontSize: isDesktop ? 18 : 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('View My Work'),
                    ),
                    OutlinedButton(
                      onPressed: () => context.go('/contact'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 40 : 40.w,
                          vertical: isDesktop ? 20 : 15.h,
                        ),
                        textStyle: TextStyle(
                          fontSize: isDesktop ? 18 : 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Contact Me'),
                    ),
                  ],
                )
                .animate()
                .slideY(
                  begin: 1, // From Bottom
                  end: 0,
                  delay: 600.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(delay: 600.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
