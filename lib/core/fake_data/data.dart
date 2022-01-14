import 'package:netflix_ui/core/utils/assets.dart';
import 'package:netflix_ui/ui/content/home/models/content_model.dart';

final Content breakingBadContent = Content(
  name: 'Breaking Bad',
  webImage: Assets.breakingBadPoster,
  titleImageUrl: Assets.breakingBadTitle,
  videoUrl: Assets.teaser,
  description:
      'Breaking Bad follows Walter White, a meek high school chemistry teacher who transforms into a ruthless player in the local methamphetamine drug trade, driven by a desire to financially provide for his family after being diagnosed with terminal lung cancer.',
);

final List<Content> top = [
  Content(
    name: "Don't Look Up",
    mobileImage: Assets.dontLookUpMobile,
    webImage: Assets.dontLookUpWeb,
    isTop: true,
    top: 1,
  ),
  Content(
    name: 'Mother Android',
    mobileImage: Assets.motherAndroidMobile,
    webImage: Assets.motherAndroidWeb,
    isTop: true,
    top: 2,
  ),
  Content(
    name: 'The Lost Daughter',
    mobileImage: Assets.lostDaughterMobile,
    webImage: Assets.lostDaughterWeb,
    isTop: true,
    top: 3,
  ),
  Content(
    name: 'Back To The Outback',
    mobileImage: Assets.backOutbackMobile,
    webImage: Assets.backOutbackWeb,
    isTop: true,
    top: 4,
  ),
  Content(
    name: 'The Unforgivable',
    mobileImage: Assets.unforgivableMobile,
    webImage: Assets.unforgivableWeb,
    isTop: true,
    top: 5,
  ),
  Content(
    name: 'Red Notice',
    mobileImage: Assets.redNoticeMobile,
    webImage: Assets.redNoticeWeb,
    isTop: true,
    top: 6,
  ),
  Content(
    name: 'Just Go With It',
    mobileImage: Assets.goWithItMobile,
    webImage: Assets.goWithItWeb,
    isTop: true,
    top: 7,
  ),
  Content(
    name: 'Journey 2',
    mobileImage: Assets.journeyTwoMobile,
    webImage: Assets.journeyTwoWeb,
    isTop: true,
    top: 8,
  ),
  Content(
    name: 'Seal Team',
    mobileImage: Assets.sealTeamMobile,
    webImage: Assets.sealTeamWeb,
    isTop: true,
    top: 9,
  ),
  Content(
    name: 'The Longest Yard',
    mobileImage: Assets.longestYardMobile,
    webImage: Assets.longestYardWeb,
    isTop: true,
    top: 10,
  ),
];

final List<Content> myList = [
  Content(
    name: 'Breaking Bad',
    mobileImage: Assets.breakingBadMobile,
    webImage: Assets.breakingBadWeb,
  ),
  Content(
    name: 'Daredevil',
    mobileImage: Assets.daredevilMobile,
    webImage: Assets.daredevilWeb,
  ),
  Content(
    name: 'Stranger Things',
    mobileImage: Assets.strangerThingsMobile,
    webImage: Assets.strangerThingsWeb,
  ),
  Content(
    name: 'Suits',
    mobileImage: Assets.suitsMobile,
    webImage: Assets.suitsWeb,
  ),
  Content(
    name: 'The End of the F***ing World',
    mobileImage: Assets.teotfwMobile,
    webImage: Assets.teotfwWeb,
  ),
  Content(
    name: 'Thirteen Reasons Why',
    mobileImage: Assets.thirteenReasonsMobile,
    webImage: Assets.thirteenReasonsWeb,
  ),
  Content(
    name: 'Umbrella Academy',
    mobileImage: Assets.umbrellaAcademyMobile,
    webImage: Assets.umbrellaAcademyWeb,
  ),
  Content(
    name: 'Witcher',
    mobileImage: Assets.witcherMobile,
    webImage: Assets.witcherWeb,
  ),
  Content(
    name: 'Naruto',
    mobileImage: Assets.narutoMobile,
    webImage: Assets.narutoWeb,
  ),
  Content(
    name: 'Spiderman 2',
    mobileImage: Assets.spidermanTwoMobile,
    webImage: Assets.spidermanTwoWeb,
  ),
];

final List<Content> originals = [
  ...myList
];

final List<Content> trending = [
  ...myList.reversed
];
