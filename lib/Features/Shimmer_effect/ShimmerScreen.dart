
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 62, 16, 0),
        child: Column(
          children: [
            SizedBox(
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _shimmerCircleContainer(height: 56, width: 56),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerText(width: 166, height: 16),
                        const SizedBox(height: 16),
                        _shimmerText(width: 144, height: 24),
                      ],
                    ),
                  ),
                  _shimmerCircleContainer(height: 32, width: 32),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _shimmerText(width: 184, height: 20),
                      _shimmerText(width: 47, height: 20),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                      Column(
                        children: [
                          _shimmerContainer(height: 40, width: 40),
                          const SizedBox(height: 8),
                          _shimmerContainer(height: 16, width: 40)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _shimmerCircleContainer(height: 52, width: 52),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _shimmerText(width: 79, height: 20),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        _shimmerText(width: 109, height: 20),
                                        const SizedBox(width: 8),
                                        _shimmerText(width: 56, height: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(height: 1, color: Colors.grey),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _shimmerText(width: 96, height: 24),
                              const SizedBox(width: 8),
                              _shimmerText(width: 74, height: 24),
                              const SizedBox(width: 8),
                              _shimmerText(width: 51, height: 24),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _shimmerContainer(height: 40, width: 84),
                              _shimmerContainer(height: 40, width: 60),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _shimmerText(width: 171, height: 20),
                _shimmerText(width: 47, height: 20),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(.4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _shimmerContainer(height: 48, width: 48),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              _shimmerText(width: 153, height: 16),
                              const SizedBox(height: 8),
                              _shimmerText(width: 28, height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.4),
                  ),
                  width: 172,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 12, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerContainer(height: 48, width: 48),
                        const SizedBox(height: 12),
                        _shimmerText(width: 116, height: 12),
                        const SizedBox(height: 12),
                        _shimmerText(width: 28, height: 20),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(.4),
                  ),
                  width: 172,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 12, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerContainer(height: 48, width: 48),
                        const SizedBox(height: 12),
                        _shimmerText(width: 116, height: 12),
                        const SizedBox(height: 12),
                        _shimmerText(width: 28, height: 20),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                )

              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(.4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _shimmerContainer(height: 48, width: 48),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              _shimmerText(width: 153, height: 16),
                              const SizedBox(height: 8),
                              _shimmerText(width: 28, height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget shimmerTopBar() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(height: 14, color: Colors.white)),
              const SizedBox(width: 8),
              Expanded(child: Container(height: 14, color: Colors.white)),
              const SizedBox(width: 8),
              Expanded(child: Container(height: 14, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(child: Container(height: 10, color: Colors.white)),
              const SizedBox(width: 8),
              Expanded(child: Container(height: 10, color: Colors.white)),
              const SizedBox(width: 8),
              Expanded(child: Container(height: 10, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerText({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _shimmerContainer({required double height, double? width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

Widget _shimmerCircleContainer({required double height, double? width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
    ),
  );
}
