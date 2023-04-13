import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/tweet_api.dart';
import 'package:twitter_clone/core/enums/tweet_type_enum.dart';
import 'package:twitter_clone/core/utils.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/models/tweet_model.dart';

final tweetControllerProvider = StateNotifierProvider<TweetController,bool>((ref) {
  return TweetController(ref: ref, tweetAPI: ref.watch(tweetAPIProvider));
});

class TweetController extends StateNotifier<bool> {
  final TweetAPI _tweetAPI;
  final Ref _ref;
  TweetController({required Ref ref, required TweetAPI tweetAPI})
      : _ref = ref,
        _tweetAPI = tweetAPI,
        super(false);

  void shareTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
   // required String repliedTo,
   // required String repliedToUserId,
  }) {
    if (text.isEmpty) {
      showSnackBar(context, 'Please Enter Text !!!');
    }

    if (images.isNotEmpty) {
      _shareImageTweet(
        images: images,
        text: text,
        context: context,
      );
    } else {
      _shareTextTweet(
        text: text,
        context: context,
      );
    }
  }

  void _shareImageTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) async{
    state = true;
    final List<String> hashtags = _getHashFromText(text);
    final List<String> link = _getLinkFromText(text);
    final user = _ref.watch(currentUserDetailsProvider).value!;
    Tweet tweet = Tweet(
        text: text,
        hashtags: hashtags,
        link: link,
        imageLinks: const [],
        uid: user.uid,
        tweetType: TweetType.image,
        tweetedAt: DateTime.now(),
        likes: const [],
        commentIds: const [],
        id: '',
        reshareCount: 0);

        final res = await _tweetAPI.shareTweet(tweet);
        res.fold((l) => showSnackBar(context,l.message), (r) => null);
        state = false;
  }

  void _shareTextTweet({
    required String text,
    required BuildContext context,
  }) async {
    state = true;
    final List<String> hashtags = _getHashFromText(text);
    final List<String> link = _getLinkFromText(text);
    final user = _ref.watch(currentUserDetailsProvider).value!;
    Tweet tweet = Tweet(
        text: text,
        hashtags: hashtags,
        link: link,
        imageLinks: const [],
        uid: user.uid,
        tweetType: TweetType.text,
        tweetedAt: DateTime.now(),
        likes: const [],
        commentIds: const [],
        id: '',
        reshareCount: 0);
        final res = await _tweetAPI.shareTweet(tweet);
        res.fold((l) => showSnackBar(context,l.message), (r) => null);
        state = false;
  }

  List<String> _getLinkFromText(String text) {
    List<String> link = [];
    List<String> sentencesInTweet = text.split('/n');

    print('printing from _getLink');

    for(String sentence in sentencesInTweet){
      List<String> wordsInSentence = sentence.split(' ');
    for (String words in wordsInSentence) {
      if (words.startsWith('www.') || words.startsWith('https://')) {
        link.add(words);
      }
    }
    
      if (sentence.startsWith('www.') || sentence.startsWith('https://')) {
        print('sentence logic');
        link.add(sentence);
      }
    

    }
   // print('all links');
    // print(link);
    return link;
  }

  List<String> _getHashFromText(String text) {
    List<String> hashtags = [];
    List<String> sentencesInTweet = text.split('/n');

    //print('printing from _getHash');
   // print(sentencesInTweet);

    for(String sentence in sentencesInTweet){
      List<String> wordsInSentence = sentence.split(' ');
    for (String words in wordsInSentence) {
      if (words.startsWith('#')) {
        hashtags.add(words);
      }
    }

    }  
    // print(hashtags);
    return hashtags;
  }
}
