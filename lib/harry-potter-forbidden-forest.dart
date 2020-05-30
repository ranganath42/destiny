import 'package:destiny/choice.dart';
import 'package:destiny/story.dart';
import 'package:destiny/story_frame.dart';

Story harryPotterForbiddenForest =
    Story(id: 'hpff', description: 'dfdfg', frames: [f1]);

StoryFrame f1 = StoryFrame(
  number: 1,
  text: 'sdfsfsdfsdf',
  first: Choice(text: 'sdfsdf', nextFrame: 1),
  second: Choice(text: 'sdfsdf', nextFrame: 1),
);
