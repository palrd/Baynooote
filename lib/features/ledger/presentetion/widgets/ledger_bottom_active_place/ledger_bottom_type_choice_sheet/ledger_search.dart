import 'dart:ui';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LedgerSearch extends StatelessWidget {
  const LedgerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // 固定高度
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(cornerRadius: 25, cornerSmoothing: 1.0),
          ),
        ),
      ),
      child: ClipSmoothRect(
        radius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: 25, cornerSmoothing: 1.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: const Color.fromARGB(132, 255, 255, 255),
            child: TextField(
              // 【关键点1】：让文字在垂直方向居中
              textAlignVertical: TextAlignVertical.center, 
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                // 【关键点2】：不设置 height: 1.0，这有时会导致文字偏上，让它自然渲染
              ),
              cursorColor: Colors.black, 
              decoration: InputDecoration(
                // 【关键点3】：使用 prefixIcon 代替外部 Row 中的 Icon
                prefixIcon: const Icon(
                  Icons.search, 
                  size: 22, 
                  color: Colors.black87
                ), 
                // 【关键点4】：彻底去掉默认 Padding
                isDense: true,
                contentPadding: EdgeInsets.zero, 
                // 去掉边框
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "搜索你想要找的分类",
                hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}