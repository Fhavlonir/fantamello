import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {

  final Uri _url = Uri.parse('https://github.com/Fhavlonir/fantasifestivalen');
  
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Om appen'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text('Hej!',
                  style: Theme.of(context).textTheme.headline1
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth:200),
                child: ClipOval(
                  child: SizedBox.fromSize(     
                    size: Size.fromRadius(100), 
                    child: CachedNetworkImage(imageUrl: 'https://pbs.twimg.com/profile_images/1373325891384786946/IkVLOrwN_400x400.jpg'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth: 400),
                child: Column( children: [
                  Text('Jag hoppas du gillar Fantasifestivalen! Jag som gjort den heter Philip Johansson, jag bor i Lund och pluggar på LTH.\nAppen är publicerad under licensen GNU Affero General Public License version 3.\nDen är byggd med hjälp av Flutter, hostad med hjälp av Github Pages och Supabase.\nBilderna kommer från Wikimedia Commons, oändliga tack till alla som bidragit med dessa, särskilt Jonatan Svensson Glad, AnnCatrin Blyckerts och Daniel Åhs Karlsson.\n\nOm du har frågor eller feedback kan du kontakta mig på philip@fantasifestivalen.se'),
                  SizedBox(height:20),
                  TextButton(child: const Text('Källkod och licens finns att tillgå via\ngithub.com/Fhavlonir/fantasifestivalen'), onPressed: _launchUrl)]),
              )
            ]
          )]
        ),
      );
  }
}
