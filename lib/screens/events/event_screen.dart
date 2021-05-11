import "package:flutter/material.dart";
import 'package:smart_city_ambience/screens/events/event_card.dart';

// Screen that shows cards with different content
// it defines background color and makes screen scrollable

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ScrollView (child) takes all the space it needs
      width: double.infinity,
      height: double.infinity,
      // background color
      color: Theme.of(context).backgroundColor,
      // this makes the column scrollable -> prevents pixel overflow on smaller phones
      child: SingleChildScrollView(
        // distributing padding between outer container (here) and cards makes
        // sure that padding on the edges and in between cards is the same
        // resulting padding = 12
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              EventCard(
                child: Event(
                    image: 'lib/images/test_image.jpg',
                    title: "test",
                    description:
                        "this is an event adlösfalö sdlöfkaöl alösdlfalösk with a lot of text aklsdfjakls aklösdfj kljaaklösdfjak ljaklösdfakls jalösdkfaklösdj aklösddfj kla aklösdfjaklösdjfkjl aklösddf klasdjflaköks aklösdfj klöasdjf klasjsfaklöjadslk jafklsdjfalks j adlksfj"),
              ),
              EventCard(
                child: Event(
                    image: 'lib/images/test_image.jpg',
                    title: "test",
                    description:
                        "this is an event adlösfalö sdlöfkaöl ajkladlfjködfaksjlöaksdfjlöasdfkjlöjklöadfgfsjioöadfsöjkladfsljköadfskjlöaksdfjlöasdfkjlöaksdfjlöajklödsfjklödfsjklödafsjklöadsfjklöasdföjkldafsöjklasdfjklöasdfjklösjklöasdfjklöadfsjkladfsjklödafsjklödafsöjkldafsjöklasdfjklöasdföjkllösdlfalösk with a lot of text aklsdfjakls aklösdfj kljaaklösdfjak ljaklösdfakls jalösdkfaklösdj aklösddfj kla aklösdfjaklösdjfkjl aklösddf klasdjflaköks aklösdfj klöasdjf klasjsfaklöjadslk jafklsdjfalks j adlksfj"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
