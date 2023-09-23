@extends('layouts.app')

@section('title')
Data Post 
@endsection

@section('content')
<div class="container">
  <div class="card">
    <h5 class="card-header bg-dark text-white"> Data Post</h5>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-striped table-hover ">
          <thead class="thead-dark">
            <tr>
              <th width="30">No</th>
              <th width="120">Creator</th>
              <th width="120">Category</th>
              <th width="240">Title</th>
              <th>Content</th>
              <th width="150">Image</th>
              <th width="180">Updated At</th>
            </tr>
          </thead>
          <tbody>
            @php ($no = 1)
            @foreach ($rows as $row)
            <tr>
              <td>{{ $no++ }}.</td>
              <td>{{ $row->username->name }}</td>
              <td>{{ $row->category->category }}</td>
              <td>{{ $row['title'] }}</td>
              <td>{{ substr($row['content'],0,400) }}...</td>
              <td><img src="{{ env('APP_URL').'/images'.'/'.$row->image }}" class="img-fluid"></td>
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