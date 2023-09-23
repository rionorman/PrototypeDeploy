@extends('layouts.app')

@section('title')
Data Post 
@endsection

@section('content')
<div class="container">
  <div class="card">
    <h5 class="card-header"> Mengunggah Data</h5>
    <div class="card-body">
      <form class="form-horizontal" action="{{ asset('/') }}post" method="post" enctype="multipart/form-data">
        <div class="mb-3 row">
          <label for="image" class="col-sm-2 col-form-label">File</label>
          <div class="col-sm-10">
            <input class="form-control" type="file" name="image" value="">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

@endsection