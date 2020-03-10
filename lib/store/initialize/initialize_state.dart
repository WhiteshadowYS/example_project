abstract class AppInitializationState {}

class NotInitialized extends AppInitializationState {}

class Initializing extends AppInitializationState {}

class Initialized extends AppInitializationState {}

AppInitializationState initialInitializationState = NotInitialized();
