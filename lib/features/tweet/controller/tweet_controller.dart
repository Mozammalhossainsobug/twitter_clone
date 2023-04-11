import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/core/utils.dart';

class TweetController extends StateNotifier<bool> {
  TweetController(): super(false);


  void shareTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
    required String repliedTo,
    required String repliedToUserId,
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
    }) {}

    void _shareTextTweet({
      required String text,
      required BuildContext context,
    }) {}

    String _getLinkFromText(String text){
    String link = '';
    List<String> wordsInSentence = text.split(' ');
    for(String words in wordsInSentence) {
      if(words.startsWith('https://') || words.startsWith('www.')) {
        link = words;
      }
    }
    return link;
    }

  List<String> _getHashFromText(String text){
    List<String> hashtags = [];
    List<String> wordsInSentence = text.split(' ');
    for(String words in wordsInSentence) {
      if(words.startsWith('#')) {
        hashtags.add(words);
      }
    }
    return hashtags;
  }

  }
