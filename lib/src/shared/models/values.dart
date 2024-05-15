part of '../shared.dart';

final class Values {
  const Values({
    this.stroke = 3.0,
    this.spacing = 20.0,
    this.baseURL = 'https://reqres.in/api',
    this.fullLogo = 'https://reqres.in/img/logo.png',
    this.placeholder = 'https://via.placeholder.com/300',
    this.justLogo = 'https://user-images.githubusercontent.com'
        '/45191605'
        '/170668043-3b3ba0f0-7348-45a1-ab9f-b12744a35aa2.png',
    this.textLogo = 'https://user-images.githubusercontent.com'
        '/45191605'
        '/170668104-381e0df8-75bc-4b7e-b39d-f6d011be97f6.png',
    this.delay = const Duration(milliseconds: 300),
    this.lipsum =
        'Reqres simulates real application scenarios. If you want to test a user authentication system, Reqres will respond to a successful login/register request with a token for you to identify a sample user, or with a 403 forbidden response to an unsuccessful login/registration attempt.\n\nA common front-end scenario that\'s easily forgotten is loading states, which can be easily simulated through Reqres by appending?delay=<a number of seconds> to any endpoint URL, which will delay the API response time. Animated loading GIFs & SVGs at the ready!',
  });

  final String fullLogo;
  final String textLogo;
  final String justLogo;
  final double stroke;
  final double spacing;
  final String baseURL;
  final String placeholder;
  final Duration delay;
  final String lipsum;
}
