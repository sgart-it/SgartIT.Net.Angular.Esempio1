import { Component } from '@angular/core';
import { ErrorService } from '../../services/error.service';

@Component({
  selector: 'app-show-errors',
  templateUrl: './show-errors.component.html',
  styleUrl: './show-errors.component.css',
  standalone: true,
  imports: []
})
export class ShowErrorsComponent {
  constructor(
    public errorService: ErrorService,
  ) { }
}
