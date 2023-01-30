import 'package:amazon_cognito_identity_dart_2/cognito.dart';

const baseUrl = "https://hgqg4q8s9h.execute-api.us-east-1.amazonaws.com/prod/";
const awsUserPoolId = 'us-east-1_ls34V4Iui';
const awsClientId = '1u7i343qclinst4uuma3a6kdke';
const awsPoolUrl = 'consumers-pool.auth.us-east-1';

CognitoUserPool userPool = CognitoUserPool(awsUserPoolId, awsClientId);

const String getOTHTokenUrl = 'oth/getToken';
const String getUserEmail = 'ode/getPrimary';
const String verifyUsername = 'ode/verifyUsername';
const String confirmAccount = 'oth/confirmUser';
const String fetchMeasurmentTypes = "oth/patient/fetchMeasurmentTypes";
const String fetchMeasurment = "oth/patient/fetchMeasurments";
const String fetchQuestionnaireList = "oth/patient/questionnaireList";
const String fetchQuestionnaire = "oth/patient/questionnaire";
