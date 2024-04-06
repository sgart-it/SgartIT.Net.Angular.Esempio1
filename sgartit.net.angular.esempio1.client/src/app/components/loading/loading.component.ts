import { Component } from '@angular/core';
import { LoadingService } from '../../services/loading.service';
import { MatProgressBarModule } from '@angular/material/progress-bar';

@Component({
  selector: 'app-loading',
  templateUrl: './loading.component.html',
  styleUrl: './loading.component.css',
  standalone: true,
  imports: [MatProgressBarModule]
})
export class LoadingComponent {
  constructor(
    public loadingService: LoadingService,
  ) { }
}
