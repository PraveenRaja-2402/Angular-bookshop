import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

import { LoginForm, RegisterForm } from '../types/Auth';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  register(form: RegisterForm) {
    throw new Error('Method not implemented.');
  }
  isAuthenticated: boolean = false;
  isLoading: boolean = false;

  constructor(private router: Router) {}

  login(form: LoginForm) {
    if (this.isLoading) return;

    this.isLoading = true;

   
  }

  }


