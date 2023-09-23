@extends('layouts.app')

@section('title')
Data Post 
@endsection

@section('content')
<div class="container">
  <div class="card">
    <h5 class="card-header bg-header-card"> Data Post</h5>
    <div class="card-body bg-body-card">
      <div class="table-responsive">
        <table class="table table-striped table-hover ">
          <thead class="thead-dark">
            <tr>
              <th width="30">No</th>
              <th width="120">Creator</th>
              <th width="120">Category</th>
              <th width="240">Title</th>
              <th>Content</th>
              <th>Image</th>
              <th width="150" class="text-center"><a class="btn btn-success" href="{{asset('/')}}post/create"> <i class="fas fa-plus"></i></a></th>
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
              <td><img src="{{ env('APP_URL').'/images/'.$row['image'] }}" class="img-fluid"></td>
              <td class=" text-center">
                <a class=" btn btn-secondary" href="{{asset('/')}}post/{{ $row['id'] }}"><i class="fas fa-info-circle"></i></a>
                <a class="btn btn-warning" href="{{asset('/')}}post/{{ $row['id'] }}/edit"><i class="far fa-edit"></i></a>
                <a class="btn btn-danger" href="{{asset('/')}}post/{{ $row['id'] }}/delete"><i class="far fa-trash-alt"></i></a>
              </td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
@endsection