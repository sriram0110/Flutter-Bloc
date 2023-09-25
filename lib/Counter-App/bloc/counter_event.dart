part of 'counter_bloc.dart';

abstract class CounterEvent {}  //blueprint for events

class IncrementEvent extends CounterEvent{}

class DecrementEvent extends CounterEvent{}
