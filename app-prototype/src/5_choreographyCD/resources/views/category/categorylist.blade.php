@extends('layouts.app')

@section('title')
Data Category 
@endsection

@section('content')
<div class="container">
  <div class="card">
    <h5 class="card-header bg-dark text-white"> Data Category</h5>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-striped table-hover ">
          <thead class="thead-dark">
            <tr>
              <th width="40">No</th>
              <th>Category</th>
              <th width="180">Updated At</th>
            </tr>
          </thead>
          <tbody>
            @php ($no = 1)
            @foreach ($rows as $row)
            <tr>
              <td>{{ $no++ }}.</td>
              <td>{{ $row['category'] }}</td>
              <td>{{ $row['updated_at'] }}</td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
@endsection