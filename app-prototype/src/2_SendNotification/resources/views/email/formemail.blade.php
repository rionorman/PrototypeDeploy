@extends('layouts.app')

@section('title')
Kirim Notifikasi
@endsection

@section('content')
<div class="container">
  <div class="card">
    <h5 class="card-header bg-orange"> Kirim e-Mail Notifikasi</h5>
    <div class="card-body bg-beige">
      @if(Session::get('message') != '')
      <div class="alert alert-primary"><strong>{{ Session::get('message') }}</strong></div>
      @endif
      <form class="form-horizontal" action="{{ asset('/sendemail') }}" method="post">
        <div class="mb-3 row">
          <label for="nama" class="col-sm-2 col-form-label"><strong>to Email</strong></label>
          <div class="col-sm-12">
            <input class="form-control" type="text" name="email" value="">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="nama" class="col-sm-2 col-form-label"><strong>Subject</strong></label>
          <div class="col-sm-12">
            <input class="form-control" type="text" name="subject" value="">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="nama" class="col-sm-2 col-form-label"><strong>Content</strong></label>
          <div class="col-sm-12">
            <textarea class="form-control" name="content" rows="10"></textarea>
          </div>
        </div>
        <div class="mb-3 row">
          <div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-warning">Reset</button>
          </div>
        </div>
        {{ csrf_field() }}
      </form>
    </div>
  </div>
</div>
@endsection