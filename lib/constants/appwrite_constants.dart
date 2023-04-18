class AppwriteConstants {
static const String databaseId = '642532584d7f2940d2d1';
static const String projectId = '64251f159ba36c23f6ee';
static const String endPoint = 'http://172.18.104.55/v1';

static const String usersCollection = '642d37cedbbbf095391c';
static const String tweetsCollection = '6436620d25a9bc7c7283';

static const String imagesBucket = '6437b437a900aadd6295';
static String imageURL(String imageId) => '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';

}