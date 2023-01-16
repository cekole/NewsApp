import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servislet_case/controllers/news_controller.dart';
import 'package:servislet_case/models/new.dart';
import 'package:url_launcher/url_launcher.dart';

class NewDetail extends StatelessWidget {
  const NewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedNew = Get.arguments as New;
    final headline = selectedNew.title.split(' - ').first;
    final publishDate =
        selectedNew.publishedAt.split('T').first.split('-').reversed.join('.');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              headline,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(selectedNew.urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  selectedNew.description,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  selectedNew.content.split('[+').first,
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      publishDate,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.blue[50],
                      ),
                    ),
                    onPressed: (() {
                      launchUrl(Uri.parse(selectedNew.url));
                    }),
                    icon: Icon(
                      Icons.open_in_browser,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      'Haber Kaynağına Git',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
