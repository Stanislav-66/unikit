
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unikit/ui/home_screen/model/search.dart';


class MessageFetcher {
  final Dio _dio = Dio();
  bool isLoading = false;
  List<Map<String, dynamic>> messages = [];
  List<Map<String, dynamic>> savedList = [];
  List<Search> listSearch = [];
  CancelToken _cancelToken = CancelToken();
  int currentPage = 0;
  final int pageSize = 10;
  bool load = false;


  Future<void> loadNews() async {
    try{
      final response = await _dio.get('http://95.165.109.146:8080/allMessages',
        cancelToken: _cancelToken,
      );
      if (response.statusCode == 200) {
        final fetchedMessages = List<Map<String, dynamic>>.from(response.data);
        messages.addAll(fetchedMessages);
        savedList.addAll(fetchedMessages);
        listSearch.addAll(fetchedMessages.map((message) => Search.fromMap(message)));
        print(listSearch.first.description);
        //print(savedList.first);

      } else {
        throw Exception('Failed to load messages');
      }
    } catch(e)
    {
      print('Error fetching messages: $e');
    }

  }

  void cancelRequests() {
    _cancelToken.cancel("Request canceled by user");
    _cancelToken = CancelToken();
  }

  Future<void> fetchMessages({bool reset = false}) async {
    if (isLoading) return;
    isLoading = true;

    try {
      if (reset) {
        messages.clear();
        currentPage = 0;
      }

      final response = await _dio.get(
        'http://95.165.109.146:8080/messages',
        queryParameters: {
          'page': currentPage,
          'pageSize': pageSize,
        },
        cancelToken: _cancelToken,
      );

      if (response.statusCode == 200) {
        final fetchedMessages = List<Map<String, dynamic>>.from(response.data);
        print(fetchedMessages);
        messages.addAll(fetchedMessages);
        currentPage += 1;
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    } finally {
      isLoading = false;
    }
  }
}