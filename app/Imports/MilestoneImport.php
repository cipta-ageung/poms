<?php

namespace App\Imports;

use App\Milestone;
use App\Task;
use App\ProjectFile;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::default('none');

class MilestoneImport implements ToModel, WithHeadingRow
{

    private $projectFile=null;

    private $milestonename=null;

    public function __construct(ProjectFile $projectFile)
    {
        $this->projectFile=$projectFile;
    }

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */

    public function model(array $row)
    {

        if (!isset($row['URAIAN PEKERJAAN'])) {
            return null;
        }

        if(is_numeric($row['No. ']) || !isset($row['No. '])){
            $milestone = Milestone::where('title', $this->milestonename)->first();
            $start_date = strtotime($row['TANGGAL MULAI']);
            $due_date = strtotime($row['TANGGAL SELESAI']);
            return new Task([
                'title' => $row['URAIAN PEKERJAAN'],
                'milestone_id' => $milestone['id'],
                'priority' => 'low',
                'description' => ' ',
                'assign_to' => \Auth::user()->id,
                'project_id' => $this->projectFile->project_id,
                'stage'=> 1,
                'order' => doubleval($row['ANGGARAN']),
                'start_date' => date('Y-m-d',$start_date),
                'due_date' => date('Y-m-d',$due_date),
            ]);
        }
        
        // simpan history milestone
        $this->milestonename=$row['URAIAN PEKERJAAN'];

        $b = intval($row['ANGGARAN']);
        $a = number_format(strval($b), 2,".","");
        return new Milestone([
            'title' => $row['URAIAN PEKERJAAN'],
            'status' => 'Incomplete',
            'cost' => doubleval($a),
            'description' => ' ',
            'project_id' => $this->projectFile->project_id,
        ]);
    }

    public function headingRow(): int
    {
        return 5;
    }
}
