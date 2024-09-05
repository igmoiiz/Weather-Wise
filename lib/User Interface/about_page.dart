import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/Utilities/text_class.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final textServices = TextClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: true,
      ),
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('Assets/Person.json'),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        _aboutText(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
      ],
    );
  }

  Widget _aboutText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textServices.about,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            _github(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            _linkedIn(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            _instagram(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          ],
        ),
      ),
    );
  }

  //  github button
  Widget _github() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.015),
      child: GestureDetector(
        onTap: () async {
          //  open url
          final url = Uri.parse('https://github.com/igmoiiz');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.07,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'GitHub',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //  linked in button
  Widget _linkedIn() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.015),
      child: GestureDetector(
        onTap: () async {
          //  open url
          final url = Uri.parse('www.linkedin.com/in/moaiz-baloch-a615392b4');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.07,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'LinkedIn',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //  instagram button
  Widget _instagram() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.015),
      child: GestureDetector(
        onTap: () async {
          //  open url
          final url = Uri.parse('https://www.instagram.com/ig_moiiz');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.07,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Instagram',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
