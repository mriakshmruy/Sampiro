// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:neos_admin_dashboard/core/constants/widget_key_constants.dart';
// import 'package:neos_admin_dashboard/features/organizations/data/models/organization.dart';
// import 'package:neos_admin_dashboard/features/users/data/models/new_user.dart';
// import 'package:neos_admin_dashboard/features/users/presentation/bloc/users_bloc.dart';
// import 'package:neos_admin_dashboard/features/users/presentation/widgets/add_user_view.dart';

// import '../../../../core/utils/form_validator_test.dart';
// import '../../../../helpers/pump_app.dart';
// import '../../../../helpers/set_display_size.dart';

// void main() {
//   late MockUsersBloc mockUsersBloc;
//   late MockGoRouter mockGoRouter;
//   late MockAppLocalizations mockAppLocalizations;

//   const newUser = NewUser(
//     lastName: 'Last',
//     firstName: 'First',
//     email: 'test@gmail.com',
//     isAdmin: true,
//     isOperator: true,
//   );

//   const devOrganization = OrganizationDataAttributes(
//     id: '2',
//     attributes: OrganizationAttributes(
//       isActive: true,
//       name: 'Development Team',
//       alias: 'Dev',
//       partOf: PartOf(data: PartOfData(id: '1')),
//     ),
//   );

//   setUp(() {
//     mockUsersBloc = MockUsersBloc();
//     mockGoRouter = MockGoRouter();
//     mockAppLocalizations = MockAppLocalizations();
//   });

//   tearDown(() => mockUsersBloc.close());

//   testWidgets('should return form is valid if valid fields are inputted adding a user', (tester) async {
//     when(mockGoRouter.pop).thenReturn(null);

//     when(() => mockAppLocalizations.newUserWasAdded).thenReturn('A new user was successfully added to the user list.');

//     tester.setDesktopDisplaySize();

//     whenListen(
//       mockUsersBloc,
//       Stream.fromIterable([
//         const UsersState(
//           statusForUserCreation: UsersStatus.loading,
//           statusInfoForAddingOfUser: 'test',
//           selectedOrganization: devOrganization,
//         ),
//         const UsersState(
//           statusForUserCreation: UsersStatus.loading,
//           statusInfoForAddingOfUser: 'test two',
//           selectedOrganization: devOrganization,
//         ),
//         UsersState(
//           statusForUserCreation: UsersStatus.successful,
//           statusInfoForAddingOfUser: mockAppLocalizations.newUserWasAdded,
//           selectedOrganization: devOrganization,
//         ),
//       ]),
//       initialState: const UsersState(selectedOrganization: devOrganization),
//     );

//     await tester.pumpApp(
//       const Material(child: AddUserView()),
//       usersBloc: mockUsersBloc,
//       mockGoRouter: mockGoRouter,
//     );
//     await tester.pump();

//     expect(find.byType(AddUserView), findsOneWidget);

//     await tester.enterText(find.byKey(WidgetKeyConstants.usersPageAddUserLastNameKey), newUser.firstName);
//     await tester.pump();

//     await tester.enterText(find.byKey(WidgetKeyConstants.usersPageAddUserFirstNameKey), newUser.lastName);
//     await tester.pump();

//     await tester.enterText(find.byKey(WidgetKeyConstants.usersPageAddUserEmailNameKey), newUser.email);
//     await tester.pump();

//     await tester.tap(find.byKey(WidgetKeyConstants.usersPageAddUserOperatorKey), warnIfMissed: false);
//     await tester.pump();

//     await tester.tap(find.byKey(WidgetKeyConstants.usersPageAddUserAdminKey), warnIfMissed: false);
//     await tester.pump();

//     final formKey = tester.widget<Form>(find.byType(Form)).key! as GlobalKey<FormState>;
//     expect(formKey.currentState!.validate(), isTrue);

//     await tester.tap(find.byKey(WidgetKeyConstants.usersPageAddUserButtonKey), warnIfMissed: false);
//     await tester.pump();
//   });

//   testWidgets('should return form is invalid if there are errors', (tester) async {
//     when(mockGoRouter.pop).thenReturn(null);

//     when(() => mockAppLocalizations.newUserWasAdded).thenReturn('A new user was successfully added to the user list.');

//     tester.setDesktopDisplaySize();

//     when(() => mockUsersBloc.state).thenReturn(const UsersState(errorMessageForUpdatingOfUser: 'Error'));

//     await tester.pumpApp(
//       const Material(child: AddUserView()),
//       usersBloc: mockUsersBloc,
//       mockGoRouter: mockGoRouter,
//     );
//     await tester.pump();

//     expect(find.byType(AddUserView), findsOneWidget);

//     await tester.enterText(find.byKey(WidgetKeyConstants.usersPageAddUserLastNameKey), 'z');
//     await tester.pump();

//     await tester.enterText(find.byKey(WidgetKeyConstants.usersPageAddUserFirstNameKey), '');
//     await tester.pump();

//     await tester.enterText(find.byKey(WidgetKeyConstants.usersPageAddUserEmailNameKey), 'z');
//     await tester.pump();

//     await tester.tap(find.byKey(WidgetKeyConstants.usersPageAddUserAdminKey), warnIfMissed: false);
//     await tester.pump();

//     final formKey = tester.widget<Form>(find.byType(Form)).key! as GlobalKey<FormState>;
//     expect(formKey.currentState!.validate(), isFalse);

//     await tester.tap(find.byKey(WidgetKeyConstants.usersPageAddUserButtonKey), warnIfMissed: false);
//     await tester.pump();
//   });
// }
