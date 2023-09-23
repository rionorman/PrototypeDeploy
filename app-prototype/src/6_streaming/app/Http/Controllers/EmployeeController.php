<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{

    public function index()
    {
        $rows = Employee::all();
        return view('employee/employeelist', ['rows' => $rows]);
    }

    public function create()
    {
        return view('employee/employeeform', ['action' => 'insert']);
    }

    public function store(Request $request)
    {
        $employee = new Employee;
        $employee->id = $request->id;
        $employee->nik = $request->nik;
        $employee->nama = $request->nama;
        $employee->alamat = $request->alamat;
        $employee->email = $request->email;
        $employee->save();
        return redirect('/employee');
    }

    public function show($id)
    {
        $employee = Employee::find($id);
        return view('employee/employeeform', ['row' => $employee, 'action' => 'detail']);
    }

    public function edit($id)
    {
        $employee = Employee::find($id);
        return view('employee/employeeform', ['row' => $employee, 'action' => 'update']);
    }

    public function update(Request $request)
    {
        $employee = Employee::find($request->id);
        $employee->id = $request->id;
        $employee->nik = $request->nik;
        $employee->nama = $request->nama;
        $employee->alamat = $request->alamat;
        $employee->email = $request->email;
        $employee->save();
        return redirect('/employee');
    }

    public function delete($id)
    {
        $employee = Employee::find($id);
        return view('employee/employeeform', ['row' => $employee, 'action' => 'delete']);
    }

    public function destroy($id)
    {
        $employee = Employee::find($id);
        $employee->delete();
        return redirect('/employee');
    }
}
