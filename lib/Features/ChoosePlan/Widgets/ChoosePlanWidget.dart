import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterpractices/Features/ChoosePlan/utils/AppColors.dart';
import 'package:flutterpractices/generated/assets.dart';

Widget ChoosePlanWidget({required int isFreePlan, required int isMostPopular}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isMostPopular == 1)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgPaidPlan,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  "Most Popular",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: isFreePlan == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Assets.choosePlanFreeIcon,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Free Plan",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColor,
                            fontFamily: 'Nunito',
                            fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Stay Connected & Aware",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor2,
                            fontFamily: 'Nunito',
                            fontSize: 16),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Assets.choosePlanPaidIcon,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Pro Plan",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColor,
                            fontFamily: 'Nunito',
                            fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Your Full Self-Care Toolkit",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor2,
                            fontFamily: 'Nunito',
                            fontSize: 16),
                      ),
                    ],
                  ),
          ),
        ),
        isFreePlan == 0
            ? Container(
                width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.bgFreePlan,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0)),
          ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  " \$0 / Forever",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textColorPrimary,
                                      fontFamily: 'Nunito',
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Perfect for users beginning their mental wellness journey",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor2,
                                  fontFamily: 'Nunito',
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What’s included",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textColor,
                                  fontFamily: 'Nunito',
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Access to AI Chat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "(3 messages per day)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor2,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Book therapy appointments anytime",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "View mood entries",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "(last 7 days)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor2,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Daily Mood Tracker",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily:
                                    'Nunito', // Optional if you use custom fonts
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Get started with the essentials. Track your moods, connect with your therapist, and try out our AI Chat.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                              fontFamily: 'Nunito',
                              fontSize: 12),
                        ),
                      ],
                    )),
              )
            : Container(
                width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.bgPaidPlan,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0)),
          ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  " \$9.99/month",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textColorPrimary,
                                      fontFamily: 'Nunito',
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              " Perfect for users beginning their mental wellness journey",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor2,
                                  fontFamily: 'Nunito',
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Includes Everything in Free, Plus",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textColor,
                                  fontFamily: 'Nunito',
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Unlimited AI Chat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Smart AI Suggestions (mood-based insights)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Full Library of Calm Music & Healing Sounds",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "All Guided Exercises",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Unlimited Journaling with prompts",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Full Mood History & Weekly/Monthly Insights",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Access to Premium Blogs & Articles",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.choosePlanCheckIcon,
                                    height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "Early access to new features",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          // for ripple inside the rounded container
                          child: Container(
                            width: double.infinity,
                            // Fill horizontally
                            height: 48,
                            // Height you showed (48 Hug)
                            decoration: BoxDecoration(
                              color: AppColors.textColorPrimary.withOpacity(.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily:
                                    'Nunito', // Optional if you use custom fonts
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Unlock the complete support system for your mind. More reflection, deeper insights, full freedom to heal.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                              fontFamily: 'Nunito',
                              fontSize: 12),
                        ),
                      ],
                    )),
              )
      ],
    ),
  );
}
