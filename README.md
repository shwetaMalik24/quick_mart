# quickmart

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

**How Everything is Connected**

Step-by-step Flow:
1 User clicks Login button → LoginCubit.login(email, password) is called.
2 LoginCubit calls UserRepositoryImpl.login().
3 UserRepositoryImpl calls UserRemoteDataSource.login().
4 Fake API returns UserModel (or real API response).
5 Converts UserModel → UserEntity and returns it.
6 LoginCubit updates the UI state:

If successful → emit(LoginSuccess(user)) → UI shows success.
If failed → emit(LoginFailure(error)) → UI shows error.


┌──────────────────────────────────────────────┐
│                  UI Layer (Presentation)     │  
│       - Screens, Widgets                     │  
│       - State Management (BLoC, Provider)    │  
└──────────────────────────────────────────────┘
                 │ Calls (through BLoC)  
                 ▼  
┌──────────────────────────────────────────────┐
│         Domain Layer (Business Logic)        │  
│       - Use Cases (LoginUseCase)             │  
│       - Abstract Repositories                │  
└──────────────────────────────────────────────┘
             │ Calls (via Interface)  
             ▼  
┌──────────────────────────────────────────────┐
│            Data Layer (API/DB)               │  
│       - API Calls (UserRemoteDataSource)     │  
│       - Database Operations (if needed)      │  
│       - Repository Implementations           │  
└──────────────────────────────────────────────┘
