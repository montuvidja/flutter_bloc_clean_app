import '../../presentation/screens/dashboard/tags/tags_imports.dart';
import '../data_sources/remote/api_end_points.dart';
import '../data_sources/remote/dio_client.dart';

class TagsRepo extends DioClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      var response = await getRequest(path: ApiEndPointUrls.tags);

      if(response.statusCode == 200){
        final finalResponseData = TagsModel.fromJson(response.data);
        return finalResponseData;
      } else {
        TagsModel();
      }
    } on Exception catch (e) {
      TagsModel();
    }

    return TagsModel();
  }
}