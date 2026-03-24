import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String recommendation;

  const RecommendationCard({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    // Card com foco educativo: destina-se a chamar a atenção do aluno
    // para as dicas de futebol configuradas na ViewModel
    return Card(
      elevation: 4,
      color: Colors.green.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.green.shade300, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sports_soccer, color: Colors.green.shade800),
                const SizedBox(width: 8),
                Text(
                  'Dica para o Jogo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              recommendation,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade900,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
