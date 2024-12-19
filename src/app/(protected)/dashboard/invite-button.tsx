"use client";

import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import useProject from "@/hooks/use-project";
import { UserPlus } from "lucide-react";
import React, { useState } from "react";
import { toast } from "sonner";

const InviteButton = () => {
  const { projectId } = useProject();
  const [open, setOpen] = useState(false);
  return (
    <>
      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Invite Team Members</DialogTitle>
            <p className="text-sm text-gray-500">
              Ask them to copy and paste this link
            </p>
            <Input
              readOnly
              className="mt-4"
              onClick={() => {
                navigator.clipboard.writeText(
                  `${window.location.origin}/join/${projectId}`,
                );
                toast.success("Copied to clipboard");
              }}
              value={`${window.location.origin}/join/${projectId}`}
            />
          </DialogHeader>
        </DialogContent>
      </Dialog>
      <Button onClick={() => setOpen(true)} size={"sm"}>
        <UserPlus /> Invite Members
      </Button>
    </>
  );
};

export default InviteButton;
