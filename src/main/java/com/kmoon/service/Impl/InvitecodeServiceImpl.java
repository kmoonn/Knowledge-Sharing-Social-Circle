package com.kmoon.service.Impl;

import com.kmoon.mapper.InvitecodeMapper;
import com.kmoon.model.Invitecode;
import com.kmoon.service.InvitecodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
@Transactional
public class InvitecodeServiceImpl implements InvitecodeService {

    @Autowired
    private InvitecodeMapper invitecodeMapper;

    @Override
    public List<Invitecode> findAllInvitecode() {
        return invitecodeMapper.findAllInvitecode();
    }

    @Override
    public void save(Invitecode code) {
        invitecodeMapper.saveInvitecode(code);
    }

    @Override
    public void deleteInvitecode(String icode) {
        invitecodeMapper.deleteInvitecode(icode);
    }
}
