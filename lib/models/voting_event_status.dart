import 'package:flutter/material.dart';

enum VotingEventStatus {
  peace(
    status: 'peace',
    mood: '😌',
    chipLabel: '快適',
    moodColor: Colors.green,
  ),
  waiting(
    status: 'waiting',
    mood: '😒',
    chipLabel: 'ちょっと不満..',
    moodColor: Colors.purple,
  ),
  voting(
    status: 'voting',
    mood: '🔥',
    chipLabel: 'エアコン戦争勃発!!',
    moodColor: Colors.red,
  ),
  finished(
    status: 'エアコン戦争終結',
    mood: '🎉',
    chipLabel: 'エアコン戦争に終止符が打たれました!!',
    moodColor: Colors.blue,
  );

  const VotingEventStatus({
    required this.status,
    required this.mood,
    required this.chipLabel,
    required this.moodColor,
  });

  final String status;
  final String mood;
  final String chipLabel;
  final Color moodColor;
}
