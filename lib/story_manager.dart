import 'package:destiny/breakdown.dart';
import 'package:destiny/choice.dart';
import 'package:destiny/story.dart';
import 'package:destiny/story_frame.dart';

class StoryManager {
  List<Story> _storyData = [
    breakdown,
  ];
  int _currentStoryIndex = 0;
  int _currentFrameNumber = 0;

  StoryFrame currentFrame() =>
      _storyData[_currentStoryIndex].frames[_currentFrameNumber];

  String storyText() => currentFrame().text;

  String choiceText(int choice) {
    if (currentFrame().choices != null) {
      return currentFrame().choices[choice].text;
    }
    return "";
  }

  void advanceFrame(int choice) {
    if (currentFrameHasChoices()) {
      _currentFrameNumber = currentFrame().choices[choice].nextFrame;
    }
    print("after $_currentFrameNumber");
  }

  bool currentFrameHasChoices() => currentFrame().choices != null;

  List<Choice> nextFrameChoices() {
    return currentFrame().choices;
  }

  void restartStory() => _currentFrameNumber = 0;
}
