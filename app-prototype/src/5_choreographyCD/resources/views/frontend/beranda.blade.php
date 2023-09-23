@extends('layouts.app')

@section('title')
Beranda
@endsection

@section('content')
<div class="container">
  <h1>Beranda</h1>
  <hr>
  <div class="row row-cols-1 row-cols-md-4 g-3">
    @php ($no = 1)
    @foreach ($rows as $row)
    <div class="col">
      <div class="card h-100">
        <img src="{{ env('APP_URL').'/images'.'/'.$row->image }}" height="160" class="card-img-top" alt="...">
        <div class="card-body">
          {{$row->category->category}} - {{ formatTanggal($row->updated_at) }}
          <p>
            <a class="link-success link-underline-opacity-25" href="{{asset('/detail').'/'.$row->id }}">
              <b class="card-title">{{ $row->title }}</b></a>
          </p>
        </div>
      </div>
    </div>
    @endforeach
  </div>

</div>
@endsection