import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({required this.summaryData, super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    // padding: const EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['user_answer'] == data['correct_answer']
                          ? Colors.green
                          : Colors.red,
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.montserrat(
                              color:
                                  data['user_answer'] == data['correct_answer']
                                      ? Colors.green
                                      : Colors.red,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Correct Answer :",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                            ),
                            Text(
                              data['correct_answer'].toString(),
                              style: GoogleFonts.montserrat(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
