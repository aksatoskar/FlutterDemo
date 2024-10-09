import 'dart:async';

enum Event {
  INCREMENT,
  DECREMENT;
}

class CounterController {
 int count = 0;

 StreamSubscription? listener;

  CounterController() {
    listener =  _eventStreamController.stream.listen((Event event) {
      switch (event) {
        case Event.INCREMENT:
          {
            count++;
          }
        case Event.DECREMENT:
          {
            count--;
          }
      }
      counterSink.add(count);
    });
  }

  final StreamController<int> _counterStreamController = StreamController.broadcast();

  StreamSink<int> get counterSink => _counterStreamController.sink;

  Stream<int> get counterStream => _counterStreamController.stream;

  final StreamController<Event> _eventStreamController = StreamController();

  StreamSink<Event> get eventSink => _eventStreamController.sink;

  Stream<Event> get eventStream => _eventStreamController.stream;

  void dispose() {
    listener?.cancel();
    _counterStreamController.close();
    _eventStreamController.close();
  }
}
