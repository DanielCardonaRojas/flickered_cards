part of '../card_deck_animation.dart';

class CardDeckCarouselAnimation extends CardDeckAnimation {
  final double cardSpacing;

  CardDeckCarouselAnimation({this.cardSpacing = 300});

  // @override
  // void configure(bool reversing, double signedProgress) {
  //   if (!reversible)
  //     throw '''
  //   CardDeckCarouselAnimation can only be used in reversible CardDeck
  //   please set reversible to true
  //   ''';

  //   super.configure(reversing, signedProgress);
  // }

  @override
  CardDeckAnimator get nextCardAnimation {
    return (config) => _baseAnimation(
        config.offsetBy(config.dismissDirection.value * -1)..log());
  }

  @override
  CardDeckAnimator get previousCardAnimation {
    return (config) =>
        _baseAnimation(config.offsetBy(config.dismissDirection.value));
  }

  @override
  CardDeckAnimator get visibleCardAnimation {
    return (config) => _baseAnimation(config);
  }

  Matrix4 _baseAnimation(AnimationState config) {
    return Matrix4.identity()..translate(cardSpacing * config.signedProgress);
  }
}
