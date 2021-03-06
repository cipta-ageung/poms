<?php

namespace App\Imports;

use App\Milestone;
use App\Task;
use App\ProjectFile;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;
use PhpOffice\PhpSpreadsheet\Shared\Date;

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
            return new Task([
                'title' => $row['URAIAN PEKERJAAN'],
                'milestone_id' => $milestone['id'],
                'priority' => 'low',
                'bobot' => doubleval($row['BOBOT']),
                'description' => ' ',
                'assign_to' => \Auth::user()->id,
                'project_id' => $this->projectFile->project_id,
                'stage'=> 1,
                'order' => 0,
                'cost' => doubleval($row['ANGGARAN']),
                'start_date' => Date::excelToDateTimeObject($row['TANGGAL MULAI']),
                'due_date' => Date::excelToDateTimeObject($row['TANGGAL SELESAI']),
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
