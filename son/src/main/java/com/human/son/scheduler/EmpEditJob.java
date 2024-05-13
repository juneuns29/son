package com.human.son.scheduler;

import org.quartz.*;
import org.springframework.scheduling.quartz.*;

public class EmpEditJob extends QuartzJobBean {
	private EmpEdit eEdit;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		eEdit.editSal();
	}

	public void seteEdit(EmpEdit eEdit) {
		this.eEdit = eEdit;
	}
}
