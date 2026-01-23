"use client";

import { Button } from "@/components/ui/button";
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  useSidebar,
} from "@/components/ui/sidebar";
import useProject from "@/hooks/use-project";
import { cn } from "@/lib/utils";
import {
  CreditCard,
  Drone,
  LayoutDashboard,
  Plus,
  Presentation,
} from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";

import { driver } from "driver.js";
import "driver.js/dist/driver.css";


const driverObj = driver({
  showProgress: true,
  steps: [{
    element: '#sidebar-guide',
    popover: {
      title: 'This is the sidebar',
      description: 'You can find all your projects in here as well as access your Q&A, Meetings and the Billing page',
    },
  },
  {
    element: '#sidebarlinks-guide',
    popover: {
      title: 'This is your application tab',
      description: 'You can find all your sidebar links in here. Access your Q&A, Meetings and the Billing page',
    },
  },
  {
    element: '#projects-guide',
    popover: {
      title: 'This is the projects section',
      description: 'You can find all your projects in here as well as create new ones',
    },
  },
  {
    element: '#create-project-guide',
    popover: {
      title: 'Create a new project by clicking on the button below',
      description: "All you need is a GitHub repository URL and a GitHub token (optional)",
    },
  },
  {
    element: '#projectname-guide',
    popover: {
      title: 'Enter your project name',
    },
  },
  {
    element: '#githuburl-guide',
    popover: {
      title: 'Link your GitHub repository to your project',
    },
  },
  {
    element: '#githubtoken-guide',
    popover: {
      title: 'Enter your GitHub token (optional)',
    },
  },
  ],
});

driverObj.drive();

const items = [
  { title: "Dashboard", url: "/dashboard", icon: LayoutDashboard },
  { title: "Q&A", url: "/qa", icon: Drone },
  { title: "Meetings", url: "/meetings", icon: Presentation },
  { title: "Billing", url: "/billing", icon: CreditCard },
];

export function AppSidebar() {
  const pathname = usePathname();
  const { open } = useSidebar();
  const { projects, projectId, setProjectId } = useProject();
  return (
    <Sidebar collapsible="icon" variant="floating" >
      <SidebarHeader >
        <div className="flex items-center gap-2">
          <Image src={"/mach.svg"} alt="logo" width={40} height={40} />
          {open && <h1 className="text-primary/80 text-xl font-bold">Mach</h1>}
        </div>
      </SidebarHeader>
      <SidebarContent id="sidebar-guide">
        <SidebarGroup id="sidebarlinks-guide">
          <SidebarGroupLabel >Application</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu >
              {items.map((item) => {
                return (
                  <SidebarMenuItem key={item.title}>
                    <SidebarMenuButton asChild>
                      <Link
                        href={item.url}
                        className={cn({
                          "!bg-primary !text-white": pathname === item.url,
                        })}
                      >
                        <item.icon />
                        <span>{item.title}</span>
                      </Link>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                );
              })}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup >
        <SidebarGroup id="projects-guide">
          <SidebarGroupLabel >Your Projects</SidebarGroupLabel>
          <SidebarGroupContent >
            <SidebarMenu>
              {projects?.map((project) => {
                return (
                  <SidebarMenuItem key={project.id}>
                    <SidebarMenuButton asChild>
                      <div
                        onClick={() => {
                          setProjectId(project.id);
                        }}
                      >
                        <div
                          className={cn(
                            "text-primary flex size-6 items-center justify-center rounded-sm border bg-white text-sm",
                            {
                              "bg-primary text-white": project.id === projectId,
                            },
                          )}
                        >
                          {project.projectName[0]}
                        </div>
                        <span>{project.projectName}</span>
                      </div>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                );
              })}
              <div className="h-2"></div>
              {open && (
                <SidebarMenuItem>
                  <Link href={"/create"}>
                    <Button size="sm" variant={"outline"} className="w-fit" id="create-project-guide">
                      <Plus />
                      Create Project
                    </Button>
                  </Link>
                </SidebarMenuItem>
              )}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
    </Sidebar>
  );
}
