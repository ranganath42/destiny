import 'package:destiny/choice.dart';
import 'package:destiny/story.dart';
import 'package:destiny/story_frame.dart';

Story breakdown = Story(id: 'brkd', description: 'dfdfg', frames: frameList);

List<StoryFrame> frameList = [
  StoryFrame(
    number: 0,
    text:
        'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. '
        'You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. '
        'A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
    first: Choice(text: 'I\'ll hop in. Thanks for the help!', nextFrame: 1),
    second:
        Choice(text: 'Better ask him if he\'s a murderer first.', nextFrame: 1),
  ),
  StoryFrame(
    number: 1,
    text: 'He nods slowly, unphased by the question.',
    first: Choice(text: 'At least he\'s honest. I\'ll climb in.', nextFrame: 1),
    second: Choice(text: 'Wait, I know how to change a tire.', nextFrame: 1),
  ),
  StoryFrame(
    number: 2,
    text:
        'As you begin to drive, the stranger starts talking about his relationship with his mother. '
        'He gets angrier and angrier by the minute. He asks you to open the glovebox. '
        'Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. '
        'He reaches for the glove box.',
    first: Choice(
        text: 'I love Elton John! Hand him the cassette tape..', nextFrame: 1),
    second: Choice(
        text: 'It\'s him or me! You take the knife and stab him.',
        nextFrame: 1),
  ),
  StoryFrame(
    number: 3,
    text:
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of '
        'accidental death for most adult age groups?',
  ),
  StoryFrame(
    number: 4,
    text:
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of '
        'stabbing someone while they are driving a car you are in.',
  ),
  StoryFrame(
    number: 3,
    text:
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". '
        'He drops you off at the next town. '
        'Before you go he asks you if you know any good places to dump bodies. '
        'You reply: "Try the pier".',
  ),
];
